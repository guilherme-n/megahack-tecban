import 'package:flutter/material.dart';

class Financeiro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Color(0xff4e43a7),
            ),
            height: 150,
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 40),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 60),
                        Text(
                          'Guilherme Nascimento',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff4ec585),
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
                                color: Color(0xff4ec585),
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
                    SizedBox(width: 40),
                    Container(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        'imagens/carteira_verde.png',
                      ),
                    )
                  ],
                )
              ],
            )),
        SizedBox(height: 30),
        Column(
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
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                          backgroundColor: Colors.white,
                        )),
                    SizedBox(height: 13),
                    Text(
                      'Locomoção - 30%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.6,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                          backgroundColor: Colors.white,
                        )),
                    SizedBox(height: 13),
                    Text(
                      'Saúde - 10%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.3,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
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
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                          backgroundColor: Colors.white,
                        )),
                    SizedBox(height: 13),
                    Text(
                      'Locomoção - 30%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.6,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                          backgroundColor: Colors.white,
                        )),
                    SizedBox(height: 13),
                    Text(
                      'Saúde - 10%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4e43a7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Color(0xff4ec585)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 15,
                        width: 140,
                        child: LinearProgressIndicator(
                          value: 0.3,
                          valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
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
                color: Color(0xff4e43a7),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Color(0xff4ec585)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 300,
                child: LinearProgressIndicator(
                  value: 0.8,
                  valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                  backgroundColor: Colors.white,
                )),
            SizedBox(height: 2),
            Text(
              'R\$ 2.500,00',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff4e43a7),
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
                color: Color(0xff4e43a7),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Color(0xff4ec585)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 300,
                child: LinearProgressIndicator(
                  value: 0.9,
                  valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                  backgroundColor: Colors.white,
                )),
            SizedBox(height: 2),
            Text(
              'R\$ 2.800,00',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff4e43a7),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
