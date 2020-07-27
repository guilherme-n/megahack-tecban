import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_material_design.dart';
import 'package:megahacktecban/util/constantes.dart';

class Pontos extends StatelessWidget {
  final _estiloTexto =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        child: Icon(
                          Icons.redeem,
                          size: 80,
                          color: kColorAzulMedio,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40),
                          Text(
                            'Aqui você terá',
                            style: _estiloTexto,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'acesso às suas ',
                                style: _estiloTexto,
                              ),
                              Text(
                                'conquistas,',
                                style: TextStyle(
                                  color: kColorAzulMedio,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'benefícios e serviços ',
                                style: TextStyle(
                                  color: kColorAzulMedio,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'selecionados',
                                style: _estiloTexto,
                              ),
                            ],
                          ),
                          Text(
                            'especialmente para você!',
                            style: _estiloTexto,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '35 pontos',
                    style: TextStyle(
                      color: kColorAzulMedio,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: kColorVerdeEscuro,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Minhas',
                  textoSegundaLinha: 'conquistas',
                  cor: kColorAzulEscuro,
                ),
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Meus',
                  textoSegundaLinha: 'benefícios',
                  cor: kColorAzulEscuro,
                ),
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Serviços',
                  textoSegundaLinha: 'feitos para você',
                  cor: kColorAzulEscuro,
                ),
              ],
            ),
          ),
          Text(
            'Entenda a pontuação',
            style: TextStyle(
              color: kColorVerdeEscuro,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
