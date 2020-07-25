import 'package:flutter/material.dart';
import 'package:megahacktecban/components/header.dart';

class TelaDois extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        textoPrincipal: 'Tela dois',
        context: context,
      ),
      body: Center(
        child: Text('Tela dois'),
      ),
    );
  }
}
