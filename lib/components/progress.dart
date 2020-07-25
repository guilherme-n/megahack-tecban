import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circularProgress(BuildContext context) {
  if (Platform.isIOS) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.0),
      child: CupertinoActivityIndicator(
        radius: 20,
      ),
    );
  } else {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}