import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:megahacktecban/dao/usuario_dao.dart';
import 'package:megahacktecban/util/globais.dart';
import 'package:provider/provider.dart';

class AuthService {
  FirebaseAuth _firebaseAuth;
  UsuarioDao _usuarioDao;

  AuthService() {
    _firebaseAuth = FirebaseAuth.instance;
    _usuarioDao = UsuarioDao();
  }

  Future<void> signout(BuildContext context) async {
    var usuario = Provider.of<Globais>(
      context,
      listen: false,
    ).usuarioLogado;

    if (usuario != null) {
      usuario.notificationToken = '';

      try {
        await _usuarioDao.createUpdate(usuario);
      } catch (_) {}
    }

    await _firebaseAuth.signOut();

    Provider.of<Globais>(
      context,
      listen: false,
    ).usuarioLogado = null;
  }

  Stream<FirebaseUser> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged;

  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future deleteUser() async {
    var currentUser = await _firebaseAuth.currentUser();
    await currentUser.delete();
  }
}
