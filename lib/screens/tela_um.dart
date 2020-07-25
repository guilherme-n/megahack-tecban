import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/components/header.dart';
import 'package:megahacktecban/services/auth_service.dart';

class TelaUm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        textoPrincipal: 'Tela um',
        context: context,
        trailing: Text('Sair'),
        trailingCallback: () => AuthService().signout(context),
      ),
      body: Center(
        child: Text('Tela um'),
      ),
    );
  }
}
