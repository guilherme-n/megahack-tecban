class MascarasGerais {
  static String adicionarMascaraCelular(String celular) {
    if (celular == null || celular.length != 11) {
      return celular;
    }

    return '(' +
        celular.substring(0, 2) +
        ') ' +
        celular.substring(2, 7) +
        '-' +
        celular.substring(7, 11);
  }

  static String adicionarMascaraCpfCnpj(String cpfCnpj) {
    if (cpfCnpj == null) {
      return cpfCnpj;
    }

    if (cpfCnpj.length == 11) {
      return cpfCnpj.substring(0, 3) +
          '.' +
          cpfCnpj.substring(3, 6) +
          '.' +
          cpfCnpj.substring(6, 9) +
          '-' +
          cpfCnpj.substring(9, 11);
    }

    if (cpfCnpj.length == 14) {
      return cpfCnpj.substring(0, 2) +
          '.' +
          cpfCnpj.substring(2, 5) +
          '.' +
          cpfCnpj.substring(5, 8) +
          '/' +
          cpfCnpj.substring(8, 12) +
          '-' +
          cpfCnpj.substring(12, 14);
    }

    return cpfCnpj;
  }


  /// Remove todos os caracteres exceto letras e numeros
  static String removerMascara(String valor) {
    return valor.replaceAll(RegExp('[^0-9a-zA-Z]+'), '');
  }
}