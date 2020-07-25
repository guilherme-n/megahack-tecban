import 'package:flutter/material.dart';
import 'package:megahacktecban/components/alert_dialog.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/header.dart';
import 'package:megahacktecban/components/progress.dart';
import 'package:megahacktecban/components/text_form_field_padrao.dart';
import 'package:megahacktecban/services/auth_service.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RedefinicaoSenha extends StatefulWidget {
  static const String id = 'redefinicao_senha';

  @override
  _RedefinicaoSenhaState createState() => _RedefinicaoSenhaState();
}

class _RedefinicaoSenhaState extends State<RedefinicaoSenha> {
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _globalKeyForm = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _globalKeyScaffold =
  GlobalKey<ScaffoldState>();

  String _email;
  bool _isCarregando = false;

  final RegExp _regexEmail = RegExp(kRegexEmail);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: _isCarregando,
      child: Scaffold(
        key: _globalKeyScaffold,
        appBar: header(
          textoPrincipal: 'Redefinição de senha',
          context: context,
        ),
        body: Form(
          key: _globalKeyForm,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.mail,
                  size: 150,
                ),
                TextFormFieldPadrao(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (_regexEmail.allMatches(value).isEmpty) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 20),
                BotaoPadrao(
                  textoBotao: Text(
                    'Enviar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _submit,
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

    String _msgErro;
    try {
      await _authService.sendPasswordResetEmail(_email);
      await alertDialog(
        context: context,
        titulo: 'Concluído',
        conteudo:
        'Clique no link enviado ao seu email para alterar a senha.',
        primeiroTexto: 'OK',
        primeiroTextoCallback: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      );

    } catch (error) {
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          _msgErro = 'Email inválido';
          break;
        case 'ERROR_USER_NOT_FOUND':
          _msgErro = 'Email não cadastrado';
          break;
        default:
          _msgErro = 'Erro desconhecido.';
      }
    }

    setState(() {
      _isCarregando = false;
    });

    if (_msgErro != null) {
      _globalKeyScaffold.currentState.hideCurrentSnackBar();
      _globalKeyScaffold.currentState.showSnackBar(SnackBar(
        content: (Text(_msgErro)),
      ));
    }
  }
}