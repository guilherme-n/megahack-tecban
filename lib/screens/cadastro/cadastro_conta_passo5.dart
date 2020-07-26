import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:megahacktecban/components/alert_dialog.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/progress.dart';
import 'package:megahacktecban/dao/usuario_dao.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CadastroContaPasso5 extends StatefulWidget {
  static String id = 'cadastro_conta_passo5';

  @override
  _CadastroContaPasso5State createState() => _CadastroContaPasso5State();
}

class _CadastroContaPasso5State extends State<CadastroContaPasso5> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _usuarioDao = UsuarioDao();
  final _estiloTexto = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _keyForm = GlobalKey<FormState>();
  final _controllerSenha = TextEditingController();
  UsuarioModel _usuario;
  var _isPasswordObscure = true;
  bool _isCarregando = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: _isCarregando,
      child: Scaffold(
        key: _keyScaffold,
        body: Form(
          key: _keyForm,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 80.0,
              bottom: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Agora, para proteger as suas',
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'informações, crie uma ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'senha!',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _controllerSenha,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  obscureText: _isPasswordObscure,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha a senha';
                    }
                    if (value.length < 8) {
                      return 'A senha deve ter pelo menos 8 caracteres';
                    }
                    if (!RegExp(kRegexSenha).hasMatch(value)) {
                      return 'Senha não atende aos requisitos mínimos';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _usuario.senha = value;
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  decoration: InputDecoration(
                      hintText: '°°°°°°°°',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: _isPasswordObscure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                      )),
                ),
                SizedBox(height: 30),
                _criarMarcadorLista('Uma letra'),
                SizedBox(height: 20),
                _criarMarcadorLista('Um número'),
                SizedBox(height: 20),
                _criarMarcadorLista('Pelo menos 8 caracteres'),
                Spacer(),
                BotaoPadrao(
                  textoBotao: Text(
                    'Concluir cadastro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  corBotao: kColorAzulMedio,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (!_keyForm.currentState.validate()) {
      return;
    }

    _keyForm.currentState.save();

    setState(() {
      _isCarregando = true;
    });

    String _msgErro;
    try {
      var resultado = await _auth.createUserWithEmailAndPassword(
        email: _usuario.email,
        password: _usuario.senha,
      );

      if (resultado.user != null) {
        _usuario.id = resultado.user.uid;
        await _usuarioDao.createUpdate(_usuario);

        await alertDialog(
          context: context,
          titulo: 'Usuário criado com sucesso',
          conteudo: 'Comece já a usar o App!',
          primeiroTexto: 'OK',
          primeiroTextoCallback: () {
            _auth.signOut();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      }
    } catch (error) {
      switch (error.code) {
        case 'ERROR_WEAK_PASSWORD':
          _msgErro = 'Senha fraca';
          break;
        case 'ERROR_INVALID_EMAIL':
          _msgErro = 'Email inválido';
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          _msgErro = 'Este email já foi cadastrado';
          break;
        default:
          _msgErro = 'Erro desconhecido.';
      }
    }

    setState(() {
      _isCarregando = false;
    });

    if (_msgErro != null) {
      _keyScaffold.currentState.hideCurrentSnackBar();
      _keyScaffold.currentState.showSnackBar(SnackBar(
        content: (Text(_msgErro)),
      ));
    }
  }

  Row _criarMarcadorLista(String texto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 8.0,
          width: 8.0,
          decoration: new BoxDecoration(
            color: kColorAzulEscuro,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Text(
          texto,
          style: _estiloTexto,
        ),
      ],
    );
  }
}
