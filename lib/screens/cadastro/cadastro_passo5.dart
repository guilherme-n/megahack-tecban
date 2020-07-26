import 'package:flutter/material.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroPasso5 extends StatefulWidget {
  static String id = 'cadastro_passo5';

  @override
  _CadastroPasso5State createState() => _CadastroPasso5State();
}

class _CadastroPasso5State extends State<CadastroPasso5> {
  final _estiloTexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _controllerRg = TextEditingController();
  UsuarioModel _usuario;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
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
                IndicadorProgressoCadastro(passoAtual: 5),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        'E do seu ',
                        style: _estiloTexto,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'RG.',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pode ficar tranquilo(a)',
                    style: _estiloTexto,
                  ),
                  Text(
                    'seus dados estão seguros.',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controllerRg,
                    keyboardType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => _submit(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: '4.444.444',
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
        onPressed: _submit,
        child: Icon(
          Icons.arrow_forward,
          size: 40,
          color: kColorVerdeEscuro,
        ),
      ),
    );
  }

  void _submit() {
    if (_controllerRg.text.isEmpty) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu email para prosseguir'),
        ),
      );
      return;
    }
    _usuario.rg = _controllerRg.text;
    _keyScaffold.currentState.showSnackBar(
      SnackBar(
        content: Text('Ainda não implementado'),
      ),
    );
  }
}
