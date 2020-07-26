import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:megahacktecban/exceptions/document_not_found_exception.dart';
import 'package:megahacktecban/model/usuario_model.dart';

class UsuarioDao {
  final _refUsuarios = Firestore.instance.collection('usuarios');

  Future<UsuarioModel> read(String id) async {
    var snapshot =
    await _refUsuarios.document(id).get();

    if (!snapshot.exists) {
      throw DocumentNotFoundException();
    }

    return UsuarioModel.fromFirestore(snapshot);
  }

  Future<void> createUpdate(UsuarioModel usuario) async {
    if (usuario.id == null) throw Exception('Id não fornecido');

    await _refUsuarios
        .document(usuario.id)
        .setData(usuario.toJson());
  }
}