import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int _indiceSelecionado = 0;
bool _isOperacaoCancelada = false;

Future<int> showComboBox({
  @required BuildContext context,
  @required List<String> opcoesCombo,
  @required int indiceInicial,
  @required String nomeCampo,
  int qtdLinhas = 1,
}) async {
  _indiceSelecionado = indiceInicial;

  FocusScope.of(context).requestFocus(FocusNode());
  var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

  if (qtdLinhas < 1 || qtdLinhas > 3) {
    throw ArgumentError.value(qtdLinhas, 'Tamanho não suportado');
  }

  if (Platform.isIOS) {
    _indiceSelecionado = -1;
    var indiceTemporario = _indiceSelecionado;

    double containerPrincipalHeight;
    double containerPickerHeight;
    double itemExtent;

    if (qtdLinhas == 1) {
      containerPrincipalHeight = 200;
      containerPickerHeight = 150;
      itemExtent = 27;
    } else if (qtdLinhas == 2) {
      containerPrincipalHeight = 300;
      containerPickerHeight = 250;
      itemExtent = 58;
    } else if (qtdLinhas == 3) {
      containerPrincipalHeight = 350;
      containerPickerHeight = 300;
      itemExtent = 85;
    }

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: containerPrincipalHeight,
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Tamanho do botao 'concluido' para o texto poder ficar centralizado
                SizedBox(width: 91),
                Text(
                  nomeCampo,
                  style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                CupertinoButton(
                  padding:
                  EdgeInsets.only(top: 0, right: 8, bottom: 0, left: 0),
                  child: Text(
                    'Concluído',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (indiceTemporario == -1) {
                      _indiceSelecionado = 0;
                    } else {
                      _indiceSelecionado = indiceTemporario;
                    }

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Container(
              height: containerPickerHeight,
              child: CupertinoPicker(
                scrollController:
                FixedExtentScrollController(initialItem: indiceInicial),
                itemExtent: itemExtent,
                children: opcoesCombo
                    .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      e,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
                    .toList(),
                onSelectedItemChanged: (value) {
                  indiceTemporario = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => ComboBoxPadrao(
        opcoesCombo: opcoesCombo,
        nomeCampo: nomeCampo,
        qtdLinhas: qtdLinhas,
      ),
    );
  }

  if (_isOperacaoCancelada) {
    return -1;
  } else {
    return _indiceSelecionado;
  }
}

class ComboBoxPadrao extends StatefulWidget {
  final List<String> opcoesCombo;
  final String nomeCampo;
  final int qtdLinhas;
  const ComboBoxPadrao({
    Key key,
    @required this.opcoesCombo,
    @required this.nomeCampo,
    @required this.qtdLinhas
  }) : super(key: key);
  @override
  _ComboBoxPadraoState createState() => _ComboBoxPadraoState();
}

class _ComboBoxPadraoState extends State<ComboBoxPadrao> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.nomeCampo),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            _isOperacaoCancelada = true;
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            if (_indiceSelecionado == -1) {
              _indiceSelecionado = 0;
            }
            _isOperacaoCancelada = false;
            Navigator.of(context).pop();
          },
        ),
      ],
      content: DropdownButton(
        itemHeight: widget.qtdLinhas < 3 ? 48.0 : 72.0,
        value: widget.opcoesCombo
            .elementAt(_indiceSelecionado > 0 ? _indiceSelecionado : 0),
        items: widget.opcoesCombo.map((dropDownStringItem) {
          return DropdownMenuItem(
            value: dropDownStringItem,
            child: Text(dropDownStringItem.toString()),
          );
        }).toList(),
        onChanged: (value) {
          _indiceSelecionado = widget.opcoesCombo.indexOf(value);
          setState(() {});
        },
        isExpanded: true,
      ),
    );
  }
}