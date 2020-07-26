import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo2.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroPasso1 extends StatelessWidget {
  static String id = 'cadastro_passo1';
  final _estiloTexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
  final _controllerNome = TextEditingController();
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _usuario = UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IndicadorProgressoCadastro(passoAtual: 1),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Oi, eu sou o ',
                        style: _estiloTexto,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Best4U.',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Como você prefere',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'que eu te chame?',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controllerNome,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      _submit(context);
                    },
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite aqui',
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorAzulMedio,
        onPressed: () => _submit(context),
        child: Icon(
          Icons.arrow_forward,
          size: 40,
          color: kColorVerdeEscuro,
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (_controllerNome.text.isEmpty) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu nome para prosseguir'),
        ),
      );
      return;
    }
    _usuario.nome = _controllerNome.text;
    Navigator.of(context).pushNamed(
      CadastroPasso2.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }
}
