import 'package:flutter/material.dart';

class IndicadorProgressoCadastro extends StatelessWidget {
  final _listaIndicadores = List<Widget>();
  final int passoAtual;
  final int qtdPassos;
  final Color cor;

  IndicadorProgressoCadastro({@required this.qtdPassos, @required this.passoAtual, @required this.cor});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < qtdPassos; i++) {
      _listaIndicadores.add(_retangulo(context, i + 1 <= passoAtual));
      if (i + 1 < qtdPassos) {
        _listaIndicadores.add(SizedBox(width: 7));
      }
    }

    return Row(
      children: _listaIndicadores,
    );
  }

  Widget _retangulo(BuildContext context, bool isAtivo) {
    final largura = MediaQuery.of(context).size.width / (qtdPassos + 2);
    final altura = largura / 6;
    return Container(
      height: altura,
      width: largura,
      color: isAtivo ? cor : Colors.grey,
    );
  }
}
