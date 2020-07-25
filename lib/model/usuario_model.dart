import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioModel {
  String id;
  String nome;
  String email;
  String documento;
  String celular;
  String senha;
  String senhaConfirmacao;
  String notificationToken;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.documento,
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
      documento: data['documento'],
      celular: data['celular'],
      notificationToken: data['notificationToken'] ?? '',
    );
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> usuario) {
    return UsuarioModel(
      nome: usuario['nome'],
      celular: usuario['celular'],
      email: usuario['email'],
      documento: usuario['documento'],
    );
  }

  /// Nos pedidos, so é necessario enviar nome, email, celular e documento
  Map<String, dynamic> toJsonPedido() {
    return {
      'nome': nome,
      'email': email,
      'celular': celular,
      'documento': documento,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'documento': documento,
      'celular': celular,
      'notificationToken': notificationToken,
    };
  }
}