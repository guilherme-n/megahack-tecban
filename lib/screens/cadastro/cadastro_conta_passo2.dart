import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/banco_model.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo3.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroContaPasso2 extends StatefulWidget {
  static String id = 'cadastro_conta_passo2';

  @override
  _CadastroContaPasso2State createState() => _CadastroContaPasso2State();
}

class _CadastroContaPasso2State extends State<CadastroContaPasso2> {
  final _estiloTexto = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  UsuarioModel _usuario;
  final _listaBancos = <BancoModel> [
    BancoModel(codigo: '341', nome: 'Banco Itaú Unibanco'),
    BancoModel(codigo: '237', nome: 'Banco Bradesco'),
    BancoModel(codigo: '33', nome: 'Banco Santander'),
    BancoModel(codigo: '001', nome: 'Banco do Brasil'),
    BancoModel(codigo: '104', nome: 'Caixa Econômica Federal'),
    BancoModel(codigo: '260', nome: 'Nubank'),
    BancoModel(codigo: '77', nome: 'Banco Inter'),
  ];
  int _bancoSelecionado = -1;

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
                  qtdPassos: 3,
                  passoAtual: 1,
                  cor: kColorAzulEscuro,
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Qual conta você',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'quer acompanhar?',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Selecione a sua instuição financeira',
                    style: _estiloTexto,
                  ),
                  SizedBox(height: 20),
                  criarListTile(0),
                  criarListTile(1),
                  criarListTile(2),
                  criarListTile(3),
                  criarListTile(4),
                  criarListTile(5),
                  criarListTile(6),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorVerdeEscuro,
        onPressed: () => _submit(context),
        child: Icon(
          Icons.arrow_forward,
          size: 40,
          color: kColorAzulMedio,
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (_bancoSelecionado < 0) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Informe seu banco para prosseguir'),
        ),
      );
      return;
    }
    _usuario.bancoSelecionado = _listaBancos[_bancoSelecionado];
    Navigator.of(context).pushNamed(
      CadastroContaPasso3.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }

  ListTile criarListTile(int posicao) {
    return ListTile(
      selected: _bancoSelecionado == posicao,
      leading: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Text(
          '${_listaBancos[posicao].codigo} - ',
          style: TextStyle(
              color: kColorAzulEscuro,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(_listaBancos[posicao].nome),
      onTap: () {
        setState(() {
          _bancoSelecionado = posicao;
        });
      },
    );
  }
}
