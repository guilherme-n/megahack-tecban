import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:megahacktecban/model/banco_model.dart';

class UsuarioModel {
  String id;
  String nome;
  String email;
  String cpf;
  String rg;
  String celular;
  String senha;
  String notificationToken;
  BancoModel bancoSelecionado;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.cpf,
    this.rg,
    this.celular,
    this.senha,
    this.notificationToken,
    this.bancoSelecionado
  });

  factory UsuarioModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return UsuarioModel(
      id: doc.documentID,
      nome: data['nome'],
      email: data['email'],
      cpf: data['cpf'],
      celular: data['celular'],
      rg: data['rg'],
      notificationToken: data['notificationToken'] ?? '',
//      bancoSelecionado: data['bancoSelecionado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'rg': rg,
      'celular': celular,
      'notificationToken': notificationToken,
      'bancoSelecionado': bancoSelecionado.toJson(),
    };
  }
}