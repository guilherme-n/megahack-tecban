import 'package:flutter/material.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/single_child_scrollview_padrao.dart';
import 'package:megahacktecban/services/auth_service.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollViewPadrao(
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: kColorAzulMedio,
                border: Border.all(),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      BotaoPadrao(
                        textoBotao: Text(
                          'Sair',
                          style: TextStyle(
                            color: kColorVerdeEscuro,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isBotaoSemCor: true,
                        onPressed: () => AuthService().signout(context),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        'assets/images/carteira_verde.png',
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: kPrimaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      height: 120,
                      width: 120,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Sua foto',
                    style: TextStyle(
                      fontSize: 18,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            Provider.of<Globais>(context).usuarioLogado?.nome ??
                                '',
                            style: TextStyle(
                              fontSize: 28,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Nível 3 ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '/ 10',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              )),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Porcentagem básica de gastos: ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Acompanhe seus gastos rotineiros. ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Mercado - 60%',
                style: TextStyle(
                  fontSize: 18,
                  color: kColorAzulMedio,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 15,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.8,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                    backgroundColor: Colors.white,
                  )),
              SizedBox(height: 13),
              Text(
                'Locomoção - 30%',
                style: TextStyle(
                  fontSize: 18,
                  color: kColorAzulMedio,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: kPrimaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 15,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.6,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                    backgroundColor: Colors.white,
                  )),
              SizedBox(height: 13),
              Text(
                'Saúde - 10%',
                style: TextStyle(
                  fontSize: 18,
                  color: kColorAzulMedio,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: kPrimaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 15,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.3,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                    backgroundColor: Colors.white,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
