import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/components/single_child_scrollview_padrao.dart';
import 'package:megahacktecban/components/text_form_field_padrao.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo4.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroContaPasso3 extends StatefulWidget {
  static String id = 'cadastro_conta_passo3';

  @override
  _CadastroContaPasso3State createState() => _CadastroContaPasso3State();
}

class _CadastroContaPasso3State extends State<CadastroContaPasso3> {
  final _estiloTexto = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500);
  final _keyForm = GlobalKey<FormState>();
  UsuarioModel _usuario;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: SingleChildScrollViewPadrao(
          padding:  const EdgeInsets.symmetric(
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
                    passoAtual: 2,
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
                      _usuario.bancoSelecionado.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: kColorAzulEscuro,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Precisamos de alguns dados para fazer a sincronização.',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Iremos acessar os seus dados em modo de visualização e com nível de ',
                      style: _estiloTexto,
                    ),
                    Text(
                      'segurança bancária.',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: kColorAzulEscuro,
                      ),
                    ),
                    Text(
                      'Não estamos autorizados a fazer nenhuma movimentação na conta.',
                      style: _estiloTexto,
                    ),
                    SizedBox(height: 30),
                    TextFormFieldPadrao(
                      labelText: 'Sua agência',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe sua agência';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _usuario.bancoSelecionado.agencia = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormFieldPadrao(
                      labelText: 'Conta corrente com dígito',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe sua conta corrente';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _usuario.bancoSelecionado.conta = value;
                      },
                    ),
                    Text(
                      'Coloque sua conta principal e traremos todas as conta e cartões vinculados.',
                    ),
                    SizedBox(height: 10),
                    TextFormFieldPadrao(
                      labelText: 'Senha do internet banking',
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe sua senha';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _usuario.bancoSelecionado.senha = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
    if (!_keyForm.currentState.validate()) {
      return;
    }

    _keyForm.currentState.save();

    Navigator.of(context).pushNamed(
      CadastroContaPasso4.id,
      arguments: {
        'usuario': _usuario,
      },
    );
  }
}
