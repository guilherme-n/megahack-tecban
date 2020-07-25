class DocumentNotFoundException implements Exception {
  String _message;

  DocumentNotFoundException([String message = 'Documento não encontrado']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}