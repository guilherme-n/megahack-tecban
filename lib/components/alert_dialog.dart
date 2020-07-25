import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

Future<void> alertDialog({
  @required BuildContext context,
  @required String titulo,
  @required String conteudo,
  @required String primeiroTexto,
  @required Function primeiroTextoCallback,
  bool isPrimeiroTextoDestructiveAction = false,
  String segundoTexto,
  Function segundoTextoCallback,
  bool isSegundoTextoDestructiveAction = false,
}) {
  if (Platform.isIOS) {
    var botoes = <CupertinoDialogAction>[
      CupertinoDialogAction(
        child: Text(primeiroTexto),
        onPressed: primeiroTextoCallback,
        isDestructiveAction: isPrimeiroTextoDestructiveAction,
      ),
    ];

    if (isNotBlank(segundoTexto)) {
      botoes.add(
        CupertinoDialogAction(
          child: Text(segundoTexto),
          onPressed: segundoTextoCallback,
          isDestructiveAction: isSegundoTextoDestructiveAction,
        ),
      );
    }

    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(conteudo),
        actions: botoes,
      ),
    );
  } else {
    var botoes = <FlatButton>[
      FlatButton(
        child: Text(primeiroTexto),
        onPressed: primeiroTextoCallback,
      ),
    ];

    if (isNotBlank(segundoTexto)) {
      botoes.add(FlatButton(
        child: Text(segundoTexto),
        onPressed: segundoTextoCallback,
      ));
    }

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(conteudo),
        actions: botoes,
      ),
    );
  }
}