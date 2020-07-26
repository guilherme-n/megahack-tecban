class BancoModel {
  String codigo;
  String nome;
  String agencia;
  String conta;
  String senha;

  BancoModel({
    this.codigo,
    this.nome,
    this.agencia,
    this.conta,
    this.senha,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome,
      'agencia': agencia,
      'conta': conta,
      'senha': senha,
    };
  }
}
