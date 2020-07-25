import 'package:megahacktecban/util/mascaras_gerais.dart';

class Validador {
  static bool cpf(String cpf) {
    cpf = MascarasGerais.removerMascara(cpf);

    if (cpf.length != 11) return false;

    if (cpf.split('').every((element) => element == cpf.substring(0, 1))) {
      return false;
    }

    int sum, rest;
    sum = 0;

    for (var i = 1; i <= 9; i++) {
      sum = sum + int.parse(cpf.substring(i - 1, i)) * (11 - i);
    }
    rest = (sum * 10) % 11;

    if (rest == 10 || rest == 11) rest = 0;
    if (rest != int.parse(cpf.substring(9, 10))) return false;

    sum = 0;
    for (var i = 1; i <= 10; i++) {
      sum = sum + int.parse(cpf.substring(i - 1, i)) * (12 - i);
    }
    rest = (sum * 10) % 11;

    if (rest == 10 || rest == 11) rest = 0;
    if (rest != int.parse(cpf.substring(10, 11))) return false;

    return true;
  }

  static bool cnpj(String cnpj) {
    cnpj = MascarasGerais.removerMascara(cnpj);

    if (cnpj.length > 14 || cnpj.length < 14) return false;

    if (RegExp(r'^(\d)\1+$').hasMatch(cnpj)) return true;

    final t = cnpj.length - 2,
        d = cnpj.substring(t),
        d1 = int.parse(charAt(d, 0)),
        d2 = int.parse(charAt(d, 1));

    final calc = (x) {
      final n = cnpj.substring(0, x);
      var y = x - 7, s = 0, r = 0;

      for (var i = x; i >= 1; i--) {
        s += int.parse(charAt(n, x - i)) * y--;
        if (y < 2) y = 9;
      }

      r = 11 - (s % 11);
      return r > 9 ? 0 : r;
    };

    return calc(t) == d1 && calc(t + 1) == d2;
  }

  static String charAt(String subject, int position) {
    if (subject is! String ||
        subject.length <= position ||
        subject.length + position < 0) {
      return '';
    }

    final _realPosition = position < 0 ? subject.length + position : position;
    return subject[_realPosition];
  }

  static bool maisDeUmaPalavra(String frase) {
    var qtdPalavras = frase.trim().split(' ');
    return qtdPalavras.length > 1;
  }
}