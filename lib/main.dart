import 'dart:io';

import 'package:flutter/material.dart';
import 'package:megahacktecban/screens/cadastro_usuario.dart';
import 'package:megahacktecban/screens/home.dart';
import 'package:megahacktecban/screens/login.dart';
import 'package:megahacktecban/screens/redefinicao_senha.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MegahackTecban());
}

class MegahackTecban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (Platform.isIOS) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: ChangeNotifierProvider<Globais>(
        create: (context) => Globais(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Home.id,
          routes: {
            Login.id: (context) =>
                Login(MediaQuery.of(context).platformBrightness),
            CadastroUsuario.id: (_) => CadastroUsuario(),
            Home.id: (_) => Home(),
            RedefinicaoSenha.id: (_) => RedefinicaoSenha(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
