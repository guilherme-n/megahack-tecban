import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_passo5.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/validador.dart';

class CadastroPasso4 extends StatefulWidget {
  static String id = 'cadastro_passo4';

  @override
  _CadastroPasso4State createState() => _CadastroPasso4State();
}

class _CadastroPasso4State extends State<CadastroPasso4> {
  final _estiloTexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _mascaraCpf = MaskTextInputFormatter(mask: kMascaraCpf);
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
                IndicadorProgressoCadastro(
                  qtdPassos: 5,
                  passoAtual: 4,
                  cor: kColorVerdeEscuro,
                ),
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
                        'Precisamos do seu ',
                        style: _estiloTexto,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'CPF.',
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
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [_mascaraCpf],
                    onFieldSubmitted: (_) => _submit(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: '111.111.111-11',
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
    if (!_mascaraCpf.isFill()) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu email para prosseguir'),
        ),
      );
      return;
    }

    if (!Validador.cpf(_mascaraCpf.getUnmaskedText())) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('CPF inválido'),
        ),
      );
      return;
    }
    _usuario.cpf = _mascaraCpf.getUnmaskedText();
    Navigator.of(context).pushNamed(
      CadastroPasso5.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }
}
