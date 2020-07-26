import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioModel {
  String id;
  String nome;
  String email;
  String cpf;
  String rg;
  String celular;
  String senha;
  String senhaConfirmacao;
  String notificationToken;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.cpf,
    this.celular,
    this.senha,
    this.senhaConfirmacao,
    this.notificationToken,
  });

  factory UsuarioModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return UsuarioModel(
      id: doc.documentID,
      nome: data['nome'],
      email: data['email'],
      cpf: data['cpf'],
      celular: data['celular'],
      notificationToken: data['notificationToken'] ?? '',
    );
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> usuario) {
    return UsuarioModel(
      nome: usuario['nome'],
      celular: usuario['celular'],
      email: usuario['email'],
      cpf: usuario['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'celular': celular,
      'notificationToken': notificationToken,
    };
  }
}