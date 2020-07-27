import 'dart:io';

import 'package:flutter/material.dart';
import 'package:megahacktecban/util/constantes.dart';

class BotaoMaterialDesign extends StatelessWidget {
  final String textoPrimeraLinha;
  final String textoSegundaLinha;
  final Color cor;
  final Function onClick;

  const BotaoMaterialDesign(
      {Key key,
      @required this.textoPrimeraLinha,
      @required this.textoSegundaLinha,
        @required this.cor,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Platform.isIOS ? Colors.transparent : null,
          splashColor: Platform.isIOS ? Colors.transparent : null,
          onTap: onClick,
          child: Container(
            height: 80,
            width: 250,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  textoPrimeraLinha,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  textoSegundaLinha,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cor,
            ),
          ),
        ),
      ),
    );
  }
}
