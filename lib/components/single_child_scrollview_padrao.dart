import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPaddingPadraoSingleChildScrollView =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

class SingleChildScrollViewPadrao extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool reverse;

  const SingleChildScrollViewPadrao({
    Key key,
    @required this.child,
    this.padding,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoScrollbar(
            child: SingleChildScrollView(
              padding: padding,
              child: child,
              reverse: reverse,
            ),
          )
        : Scrollbar(
            child: SingleChildScrollView(
              padding: padding,
              child: child,
              reverse: reverse,
            ),
          );
  }
}
