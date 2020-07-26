import 'dart:io';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/components/alert_dialog.dart';
import 'package:megahacktecban/dao/usuario_dao.dart';
import 'package:megahacktecban/exceptions/document_not_found_exception.dart';
import 'package:megahacktecban/screens/home_nao_autenticado.dart';
import 'package:megahacktecban/screens/tela_dois.dart';
import 'package:megahacktecban/screens/tela_um.dart';
import 'package:megahacktecban/services/auth_service.dart';
import 'package:megahacktecban/services/notification_service.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

const IconData kIconePrimeiraOpcao = Icons.account_box;
const IconData kIconeSegundaOpcao = Icons.account_balance_wallet;
const String kTextPrimeiraOpcao = 'Despesas';
const String kTextSegundaOpcao = 'Conta';
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
    TelaUm(),
    TelaDois(),
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
