import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_material_design.dart';
import 'package:megahacktecban/util/constantes.dart';

class GuiasECursos extends StatelessWidget {
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
                          Icons.school,
                          size: 80,
                          color: kColorRosa,
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
                                'acesso a ',
                                style: _estiloTexto,
                              ),
                              Text(
                                'conteúdos',
                                style: TextStyle(
                                  color: kColorRosa,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'que vão te deixar no',
                            style: _estiloTexto,
                          ),
                          Text(
                            'controle das suas finanças!',
                            style: _estiloTexto,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        'Nível 3',
                        style: TextStyle(
                          color: kColorRosa,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '/10',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Cursos',
                  textoSegundaLinha: 'e Workshops',
                  cor: kColorRosa,
                ),
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Materiais',
                  textoSegundaLinha: 'para estudo',
                  cor: kColorRosa,
                ),
                BotaoMaterialDesign(
                  textoPrimeraLinha: 'Dicas de',
                  textoSegundaLinha: 'administração',
                  cor: kColorRosa,
                ),
              ],
            ),
          ),
          Text(
            'Fique por dentro das novidades',
            style: TextStyle(
              color: kColorAzulEscuro,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
