import 'package:flutter/material.dart';

class TelaTres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Color(0xff4e43a7),
              border: Border.all(),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 90),
                Center(
                    child: Container(
                  child: Image.asset(
                    'imagens/carteira_verde.png',
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Color(0xff4ec585)),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 120,
                  width: 120,
                )),
                SizedBox(height: 15),
                Text(
                  'Sua foto',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff4ec585),
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
                          'Guilherme Nascimento',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xff4ec585),
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
                    border: Border.all(width: 3, color: Color(0xff4ec585)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 300,
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
                    border: Border.all(width: 3, color: Color(0xff4ec585)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 300,
                child: LinearProgressIndicator(
                  value: 0.3,
                  valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                  backgroundColor: Colors.white,
                )),
          ],
        )
      ],
    ));
  }
}
