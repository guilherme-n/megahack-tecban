import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahacktecban/components/header.dart';
import 'package:megahacktecban/components/single_child_scrollview_padrao.dart';
import 'package:megahacktecban/components/text_form_field_padrao.dart';
import 'package:megahacktecban/services/auth_service.dart';

class CadastroDespesas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(
          textoPrincipal: 'Cadastro de despesas',
          context: context,
          trailing: Text('Sair'),
          trailingCallback: () => AuthService().signout(context),
        ),
        body: Form(
          child: SingleChildScrollViewPadrao(
            padding: kPaddingPadraoSingleChildScrollView,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                    'Preencha os dados de acordo com os seus gastos fixos e mensais, incluindo somente as despesas pagas por você.'),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Aluguel',
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Condomínio',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Conta de Luz (Média)',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Conta de Água (Média)',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Conta de Gás (Média)',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Mercado (Média)',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Pets',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Internet',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Telefone / Celular',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Serviços de Streaming',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Gasolina / Locomoção (Média)',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'TV a Cabo',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Lazer',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Poupança para emergências',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Prestações de bens',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Compra de roupas',
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: 'Gastos emergenciais',
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}
