import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo4.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroPasso3 extends StatefulWidget {
  static String id = 'cadastro_passo3';

  @override
  _CadastroPasso3State createState() => _CadastroPasso3State();
}

class _CadastroPasso3State extends State<CadastroPasso3> {
  final _estiloTexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _mascaraCelular = MaskTextInputFormatter(mask: kMascaraCelular);
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
                IndicadorProgressoCadastro(passoAtual: 3),
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
                        'E o seu ',
                        style: _estiloTexto,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'celular?',
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
                    'não vamos te incomodar.',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [_mascaraCelular],
                    onFieldSubmitted: (_) => _submit(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: '(xx) xxxxx-xxxx',
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
    if (!_mascaraCelular.isFill()) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu celular para prosseguir'),
        ),
      );
      return;
    }
    _usuario.celular = _mascaraCelular.getUnmaskedText();
    Navigator.of(context).pushNamed(
      CadastroPasso4.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }
}
