import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/util/constantes.dart';

Widget header({
  @required String textoPrincipal,
  @required BuildContext context,
  String leadingText,
  Widget trailing,
  Function trailingCallback,
  bool isTextoVoltarMenuAnterior = false,
  bool automaticallyImplyLeading = true,
}) {
  var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

  if (Platform.isIOS) {
    Widget leadingWidget;

    if (leadingText != null) {
      leadingWidget = CupertinoButton(
        padding: EdgeInsets.all(5.0),
        onPressed: () => Navigator.of(context).pop(),
        child: Text(leadingText),
      );
    }

    if (trailing != null) {
      if (trailing is Text) {
        Text trailingTemp = trailing;
        trailing = Text(
          trailingTemp.data,
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      }
      trailing = CupertinoButton(
        padding: EdgeInsets.all(5.0),
        onPressed: trailingCallback,
        child: trailing,
      );
    }

    return CupertinoNavigationBar(
      previousPageTitle: isTextoVoltarMenuAnterior ? textoPrincipal : null,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      middle: isTextoVoltarMenuAnterior
          ? null
          : Text(textoPrincipal,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          )),
      trailing: trailing,
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white12,
    );
  } else {
    if (trailing != null) {
      if (trailing is Text) {
        Text trailingTemp = trailing;
        trailing = Text(
          trailingTemp.data,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? kPrimaryColor : Colors.white,
          ),
        );
      }
      trailing = FlatButton(
        padding: EdgeInsets.all(5.0),
        onPressed: trailingCallback,
        child: trailing,
      );
    }

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: !isTextoVoltarMenuAnterior,
      actions: trailing == null ? null : [trailing],
      title: Text(textoPrincipal),
    );
  }
}