import 'package:flutter/material.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo3.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroPasso2 extends StatefulWidget {
  static String id = 'cadastro_passo2';

  @override
  _CadastroPasso2State createState() => _CadastroPasso2State();
}

class _CadastroPasso2State extends State<CadastroPasso2> {
  final _estiloTexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
  final _controllerEmail = TextEditingController();
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _regexEmail = RegExp(kRegexEmail);
  UsuarioModel _usuario;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
    return Scaffold(
      key: _keyScaffold,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IndicadorProgressoCadastro(
                  qtdPassos: 5,
                  passoAtual: 2,
                  cor: kColorVerdeEscuro,
                ),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        'Me conta, ',
                        style: _estiloTexto,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _usuario.nome,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Qual é o seu e-mail?',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => _submit(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'email@seuemail.com',
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorAzulMedio,
        onPressed: _submit,
        child: Icon(
          Icons.arrow_forward,
          size: 40,
          color: kColorVerdeEscuro,
        ),
      ),
    );
  }

  void _submit() {
    if (_controllerEmail.text.isEmpty) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu email para prosseguir'),
        ),
      );
      return;
    }
    if (_regexEmail.allMatches(_controllerEmail.text).isEmpty) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Email inválido'),
        ),
      );
      return;
    }
    _usuario.email = _controllerEmail.text;
    Navigator.of(context).pushNamed(
      CadastroPasso3.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }
}
