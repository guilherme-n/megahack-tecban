import 'dart:io';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/components/alert_dialog.dart';
import 'package:megahacktecban/dao/usuario_dao.dart';
import 'package:megahacktecban/exceptions/document_not_found_exception.dart';
import 'package:megahacktecban/screens/financeiro.dart';
import 'package:megahacktecban/screens/guias_e_cursos.dart';
import 'package:megahacktecban/screens/home_nao_autenticado.dart';
import 'package:megahacktecban/screens/perfil.dart';
import 'package:megahacktecban/screens/pontos.dart';
import 'package:megahacktecban/services/auth_service.dart';
import 'package:megahacktecban/services/notification_service.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

const IconData kIconePrimeiraOpcao = Icons.person_outline;
const IconData kIconeSegundaOpcao = Icons.attach_money;
const IconData kIconeTerceiraOpcao = Icons.school;
const IconData kIconeQuartaOpcao = Icons.redeem;
const String kTextPrimeiraOpcao = 'Perfil';
const String kTextSegundaOpcao = 'Financeiro';
const String kTextTerceiraOpcao = 'Guias e Cursos';
const String kTextQuartaOpcao = 'Pontos';
const int kIndicePaginaInicial = 0;

class Home extends StatefulWidget {
  static String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _authService = AuthService();

  PageController _pageController;
  int _pageIndex = kIndicePaginaInicial;
  bool _isUsuarioLogado = false;
  StreamSubscription subscription;

  static final List<Widget> _telasNavegacao = <Widget>[
    Perfil(),
    Financeiro(),
    GuiasECursos(),
    Pontos(),
  ];

  static final List<BottomNavigationBarItem> _itensNavegacao = [
    BottomNavigationBarItem(
      icon: Icon(kIconePrimeiraOpcao),
      title: Text(kTextPrimeiraOpcao),
    ),
    BottomNavigationBarItem(
      icon: Icon(kIconeSegundaOpcao),
      title: Text(kTextSegundaOpcao),
    ),
    BottomNavigationBarItem(
      icon: Icon(kIconeTerceiraOpcao),
      title: Text(kTextTerceiraOpcao),
    ),
    BottomNavigationBarItem(
      icon: Icon(kIconeQuartaOpcao),
      title: Text(kTextQuartaOpcao),
    ),
  ];

  Future<void> _carregarUsuarioFirestore(FirebaseUser firebaseUser) async {
    var usuarioDao = UsuarioDao();

    try {
      var usuarioLogado = await usuarioDao.read(firebaseUser.uid);
      Provider.of<Globais>(context, listen: false).usuarioLogado =
          usuarioLogado;
    } on DocumentNotFoundException catch (_) {
      await alertDialog(
        context: context,
        titulo: 'Cadastro corrompido',
        conteudo:
            'Os dados do seu cadastro foram corrompidos.\n Por gentileza, entre em contato com o suporte para solução.',
        primeiroTexto: 'OK',
        primeiroTextoCallback: () => Navigator.of(context).pop(),
      );
      await _authService.signout(context);
    }
  }

  @override
  void initState() {
    super.initState();

    NotificationService.configureNotification(context);
    _pageController = PageController();

    _authService.onAuthStateChanged.listen((firebaseUser) {
      setState(() {
        if (firebaseUser != null) {
          _isUsuarioLogado = true;
          _pageIndex = kIndicePaginaInicial;
          _carregarUsuarioFirestore(firebaseUser);
        } else {
          _isUsuarioLogado = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isUsuarioLogado
        ? buildTelaInicialUsuarioAutorizado()
        : HomeNaoAutenticado();
  }

  Scaffold buildTelaInicialUsuarioAutorizado() {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        children: _telasNavegacao,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Platform.isIOS
          ? _buildBottomNavigationBariOS()
          : _buildBottomNavigationBarAndroid(),
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  CupertinoTabBar _buildBottomNavigationBariOS() {
    return CupertinoTabBar(
      currentIndex: _pageIndex,
      onTap: _onTap,
      items: _itensNavegacao,
      activeColor: kColorAzulEscuro,
    );
  }

  BottomNavigationBar _buildBottomNavigationBarAndroid() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: _onTap,
      items: _itensNavegacao,
    );
  }
}
