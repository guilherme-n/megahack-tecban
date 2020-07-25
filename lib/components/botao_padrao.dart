import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/util/constantes.dart';

const EdgeInsetsGeometry kMargemPadraoBotaoBottombar = EdgeInsets.only(
  left: 16.0,
  right: 16.0,
  bottom: 24.0,
  top: 8.0,
);

typedef VoidCallback<T> = void Function();

class BotaoPadrao extends StatelessWidget {
  final Text textoBotao;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final bool isBotaoSemCor;

  const BotaoPadrao({
    Key key,
    @required this.textoBotao,
    this.onPressed,
    this.margin,
    this.padding,
    this.isBotaoSemCor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Container(
        margin: margin,
        padding: padding,
        child: CupertinoButton(
          pressedOpacity: 1,
          borderRadius: BorderRadius.circular(10),
          color: isBotaoSemCor ? null : CupertinoTheme.of(context).primaryColor,
          child: textoBotao,
          onPressed: onPressed,
        ),
      );
    } else {
      Text novoTexto;
      if (!isBotaoSemCor) {
        novoTexto = Text(
          textoBotao.data,
          style: TextStyle(color: Colors.white),
        );
      } else {
        novoTexto = Text(
          textoBotao.data,
          style: textoBotao.style.copyWith(color: kPrimaryColor),
        );
      }
      return Container(
        margin: margin,
        padding: padding,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          height: 50,
          color: isBotaoSemCor ? null : kPrimaryColor,
          child: novoTexto,
          onPressed: onPressed,
        ),
      );
    }
  }
}