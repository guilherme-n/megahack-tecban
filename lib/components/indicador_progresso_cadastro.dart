import 'package:flutter/material.dart';
import 'package:megahacktecban/util/constantes.dart';

class IndicadorProgressoCadastro extends StatelessWidget {
  final _qtdPassos = 5;
  final _listaIndicadores = List<Widget>();
  final int passoAtual;

  IndicadorProgressoCadastro({@required this.passoAtual});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _qtdPassos; i++) {
      _listaIndicadores.add(_retangulo(context, i + 1 <= passoAtual));
      if (i + 1 < _qtdPassos) {
        _listaIndicadores.add(SizedBox(width: 7));
      }
    }

    return Row(
      children: _listaIndicadores,
    );
  }

  Widget _retangulo(BuildContext context, bool isAtivo) {
    final largura = MediaQuery.of(context).size.width / (_qtdPassos + 2);
    final altura = largura / 6;
    return Container(
      height: altura,
      width: largura,
      color: isAtivo ? kColorVerdeEscuro : Colors.grey,
    );
  }
}
