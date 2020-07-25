import 'package:flutter/foundation.dart';
import 'package:megahacktecban/model/usuario_model.dart';

class Globais extends ChangeNotifier {
  UsuarioModel _usuarioLogado;

  UsuarioModel get usuarioLogado => _usuarioLogado;

  set usuarioLogado(UsuarioModel usuario) {
    _usuarioLogado = usuario;
    notifyListeners();
  }
}