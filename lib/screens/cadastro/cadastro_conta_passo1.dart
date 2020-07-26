import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo2.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroContaPasso1 extends StatefulWidget {
  static const String id = 'cadastro_conta_passo1';

  @override
  _CadastroContaPasso1State createState() => _CadastroContaPasso1State();
}

class _CadastroContaPasso1State extends State<CadastroContaPasso1> {
  UsuarioModel _usuario;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/logo_roxa.png',
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Vamos sincronizar',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'a ',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'sua conta?',
                              style: TextStyle(
                                fontSize: 30,
                                color: kColorAzulMedio,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Assim poderemos te',
                          style: TextStyle(
                            fontSize: 25,
                            color: kColorAzulMedio,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'ajudar com as finanças.',
                          style: TextStyle(
                            fontSize: 25,
                            color: kColorAzulMedio,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: kColorVerdeEscuro,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 40),
                  BotaoPadrao(
                    textoBotao: Text(
                      'Cadastrar',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(
                      CadastroContaPasso2.id,
                      arguments: {
                        'usuario': _usuario,
                      },
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    corBotao: kColorAzulMedio,
                  ),
                  SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: Text(
                      'Entender melhor',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: kColorAzulMedio,
                        fontSize: 20,
                      ),
                    ),
                    isBotaoSemCor: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
