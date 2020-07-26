import 'package:flutter/material.dart';

class TelaDois extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Color(0xff4e43a7)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 90),
              Center(
                  child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset('imagens/carteira_verde.png'))),
              SizedBox(height: 90),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Seja bem vindo ',
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(a),',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'estamos preprarando',
                    style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'tudo para você!',
                    style: TextStyle(
                      fontSize: 29,
                      color: Color(0xff4ec585),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: <Widget>[
                  Text(
                    'Você também vai aprender muito',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'sobre finanças e receber ofertas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'de serviços bancários sempre',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'que subir de nível!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Color(0xff4ec585)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 30,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.9,
                    valueColor: AlwaysStoppedAnimation(Color(0xff4ec585)),
                    backgroundColor: Color(0xff4e43a7),
                  ))
            ],
          )),
    );
  }
}
