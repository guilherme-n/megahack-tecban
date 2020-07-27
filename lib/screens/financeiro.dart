import 'package:flutter/material.dart';
import 'package:megahacktecban/components/single_child_scrollview_padrao.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

class Financeiro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollViewPadrao(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: kColorAzulMedio,
              ),
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Provider.of<Globais>(context).usuarioLogado?.nome ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assets/images/carteira_verde.png',
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                Text(
                  'Porcentagem completa de gastos: ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Acompanhe seus gastos rotineiros. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.8,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
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
                                border: Border.all(
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.6,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
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
                                border: Border.all(
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.3,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
                              backgroundColor: Colors.white,
                            )),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.8,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
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
                                border: Border.all(
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.6,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
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
                                border: Border.all(
                                    width: 3, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 140,
                            child: LinearProgressIndicator(
                              value: 0.3,
                              valueColor:
                                  AlwaysStoppedAnimation(kPrimaryColor),
                              backgroundColor: Colors.white,
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Metas traçadas: ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Trace metas de gasto mensal. ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Julho / 2020',
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
                      value: 0.8,
                      valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                      backgroundColor: Colors.white,
                    )),
                SizedBox(height: 2),
                Text(
                  'R\$ 2.500,00',
                  style: TextStyle(
                    fontSize: 15,
                    color: kColorAzulMedio,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Controle seu budget: ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Programe avisos para não passar do budget. ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Julho / 2020',
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
                      value: 0.9,
                      valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                      backgroundColor: Colors.white,
                    )),
                SizedBox(height: 2),
                Text(
                  'R\$ 2.800,00',
                  style: TextStyle(
                    fontSize: 15,
                    color: kColorAzulMedio,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
