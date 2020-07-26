import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo1.dart';
import 'package:megahacktecban/screens/login.dart';
import 'package:megahacktecban/util/constantes.dart';

class HomeNaoAutenticado extends StatelessWidget {
  static const String id = 'home_nao_autenticado';

  @override
  Widget build(BuildContext context) {
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
                      'assets/images/logo_verde.png',
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Equilibre',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'o seu ',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'futuro.',
                              style: TextStyle(
                                fontSize: 40,
                                color: kColorVerdeEscuro,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
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
                      'Começar',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(CadastroPasso1.id),
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                  ),
                  SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: Text(
                      'Já sou cadastrado',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: kColorVerdeEscuro,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(Login.id),
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
