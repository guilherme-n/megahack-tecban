import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo1.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo2.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo3.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo4.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo5.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo1.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo2.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo3.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo4.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo5.dart';
import 'package:megahacktecban/screens/cadastro_usuario.dart';
import 'package:megahacktecban/screens/home.dart';
import 'package:megahacktecban/screens/login.dart';
import 'package:megahacktecban/screens/redefinicao_senha.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MegahackTecban());
  });
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
          theme: ThemeData(
            primaryColor: kColorAzulMedio,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Home.id,
          routes: {
            Login.id: (context) =>
                Login(MediaQuery.of(context).platformBrightness),
            CadastroUsuario.id: (_) => CadastroUsuario(),
            Home.id: (_) => Home(),
            RedefinicaoSenha.id: (_) => RedefinicaoSenha(),
            CadastroPasso1.id: (_) => CadastroPasso1(),
            CadastroPasso2.id: (_) => CadastroPasso2(),
            CadastroPasso3.id: (_) => CadastroPasso3(),
            CadastroPasso4.id: (_) => CadastroPasso4(),
            CadastroPasso5.id: (_) => CadastroPasso5(),
            CadastroContaPasso1.id: (_) => CadastroContaPasso1(),
            CadastroContaPasso2.id: (_) => CadastroContaPasso2(),
            CadastroContaPasso3.id: (_) => CadastroContaPasso3(),
            CadastroContaPasso4.id: (_) => CadastroContaPasso4(),
            CadastroContaPasso5.id: (_) => CadastroContaPasso5(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
