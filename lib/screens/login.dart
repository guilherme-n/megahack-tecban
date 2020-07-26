import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/header.dart';
import 'package:megahacktecban/components/progress.dart';
import 'package:megahacktecban/components/single_child_scrollview_padrao.dart';
import 'package:megahacktecban/components/text_form_field_padrao.dart';
import 'package:megahacktecban/screens/redefinicao_senha.dart';
import 'package:megahacktecban/services/notification_service.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const String id = 'login';
  final Brightness brightness;

  const Login(this.brightness);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final _firebaseAuth = FirebaseAuth.instance;
  final _globalKeyForm = GlobalKey<FormState>();
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _regexEmail = RegExp(kRegexEmail);
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();

  String _email;
  String _senha;
  FocusNode _focusSenha;
  SharedPreferences _prefs;

  var _isCarregando = false;
  var _isPasswordObscure = true;

  @override
  void initState() {
    super.initState();

    _focusSenha = FocusNode();
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      _controllerEmail.text = _prefs.getString(kPrefKeyEmailUltimoLogin) ?? '';
    });
  }

  @override
  void dispose() {
    _focusSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: _isCarregando,
      child: Scaffold(
        appBar: header(
          textoPrincipal: 'Best4u',
          context: context,
        ),
        key: _keyScaffold,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _globalKeyForm,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollViewPadrao(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormFieldPadrao(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_regexEmail.allMatches(value).isEmpty) {
                              return 'Email inválido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                          onFieldSubmitted: (_) => _focusSenha.requestFocus(),
                        ),
                        SizedBox(height: 10),
                        TextFormFieldPadrao(
                          labelText: 'Senha',
                          controller: _controllerSenha,
                          prefixIcon: Icon(Icons.vpn_key),
                          sufixIcon: IconButton(
                            icon: _isPasswordObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isPasswordObscure = !_isPasswordObscure;
                              });
                            },
                          ),
                          focusNode: _focusSenha,
                          textInputAction:
                              Platform.isIOS ? TextInputAction.join : null,
                          obscureText: _isPasswordObscure,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Informe a senha';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _senha = value;
                          },
                          onFieldSubmitted: (_) {
                            _submit();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            BotaoPadrao(
                                padding: EdgeInsets.all(0),
                                isBotaoSemCor: true,
                                textoBotao: Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPressed: () {
                                  _limparAcoesTela();
                                  Navigator.pushNamed(
                                      context, RedefinicaoSenha.id);
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BotaoPadrao(
                          textoBotao: Text(
                            'Entrar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: _submit,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_globalKeyForm.currentState.validate()) {
      return;
    }

    _globalKeyForm.currentState.save();

    setState(() {
      _isCarregando = true;
    });

    String msgErro;

    try {
      var _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email,
        password: _senha,
      );

      _prefs.setString(
        kPrefKeyEmailUltimoLogin,
        _authResult.user.email,
      );

      NotificationService.configureNotification(context);

      Navigator.of(context).pop();
    } catch (error) {
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          msgErro = 'Endereço de email inválido';
          break;
        case 'ERROR_WRONG_PASSWORD':
          msgErro = 'Senha errada';
          break;
        case 'ERROR_USER_NOT_FOUND':
          msgErro = 'Email não cadastrado';
          break;
        case 'ERROR_USER_DISABLED':
          msgErro = 'Usuário desabilitado';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          msgErro = 'Muitas requisições. Tente novamente mais tarde.';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          msgErro = 'Este tipo de autenticação não está habilitado.';
          break;
        default:
          msgErro = 'Erro desconhecido.';
      }
    }

    if (mounted) {
      setState(() {
        _isCarregando = false;
      });
    }

    if (msgErro != null) {
      _keyScaffold.currentState.hideCurrentSnackBar();
      _keyScaffold.currentState.showSnackBar(
        SnackBar(content: (Text(msgErro))),
      );
    }
  }

  void _limparAcoesTela() {
    _keyScaffold.currentState.hideCurrentSnackBar();
    _isPasswordObscure = true;
    FocusScope.of(context).requestFocus(FocusNode());
    _controllerSenha.clear();
  }
}
