import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:megahacktecban/components/alert_dialog.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/header.dart';
import 'package:megahacktecban/components/progress.dart';
import 'package:megahacktecban/components/show_combo_box.dart';
import 'package:megahacktecban/components/text_form_field_padrao.dart';
import 'package:megahacktecban/dao/usuario_dao.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/util/constantes.dart';
import 'package:megahacktecban/util/validador.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pedantic/pedantic.dart';

import '../components/single_child_scrollview_padrao.dart';

enum _Documento {
  PessoaFisica,
}

class CadastroUsuario extends StatefulWidget {
  static const String id = 'cadastro_usuario';

  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsuarioModel _usuario = UsuarioModel();
  final _mascaraCelular = MaskTextInputFormatter(mask: kMascaraCelular);
  final RegExp _regexEmail = RegExp(kRegexEmail);

  final _usuarioDao = UsuarioDao();

  final _globalKeyForm = GlobalKey<FormState>();
  final _globalKeyScaffold = GlobalKey<ScaffoldState>();

  final _controllerCpfCnpj = TextEditingController();
  final _controllerDocumento = TextEditingController();
  final _controllerNome = TextEditingController();
  final _controllerSenha = TextEditingController();

  final _focusNome = FocusNode();
  final _focusCpfCnpj = FocusNode();
  final _focusEmail = FocusNode();
  final _focusCelular = FocusNode();
  final _focusSenha = FocusNode();
  final _focusSenhaConfirmacao = FocusNode();

  var _mascaraCpfCnpj = MaskTextInputFormatter(mask: kMascaraCpf);
  String _labelCpfCnpj = 'CPF';
  String _labelNome = 'Nome completo';

  static final List<String> _listaCpfCnpj = [
    'Pessoa física',
    'Pessoa jurídica',
  ];

  static final List<String> _listaNome = [
    'Nome completo',
    'Nome fantasia',
  ];

  File _fotoUsuario;
  bool _isCarregando = false;

  @override
  void initState() {
    super.initState();
    _controllerCpfCnpj.text =
        _listaCpfCnpj.elementAt(_Documento.PessoaFisica.index);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: _isCarregando,
      child: Scaffold(
        key: _globalKeyScaffold,
        appBar: header(
          textoPrincipal: 'Cadastro de usuário',
          context: context,
        ),
        body: Form(
          key: _globalKeyForm,
          child: SingleChildScrollViewPadrao(
            padding: kPaddingPadraoSingleChildScrollView,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: _exibirCpfCnpj,
                  child: AbsorbPointer(
                    child: TextFormFieldPadrao(
                      labelText: '',
                      controller: _controllerCpfCnpj,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  labelText: _labelCpfCnpj,
                  focusNode: _focusCpfCnpj,
                  controller: _controllerDocumento,
                  inputFormatters: [_mascaraCpfCnpj],
                  keyboardType: TextInputType.number,
                  onChanged: (_) {
                    if (_mascaraCpfCnpj.isFill()) {
                      _focusNome.requestFocus();
                    }
                  },
                  validator: (value) {
                    if (!_mascaraCpfCnpj.isFill()) {
                      return 'Preencha o $_labelCpfCnpj';
                    } else if (!Validador.cpf(value) &&
                        !Validador.cnpj(value)) {
                      return '$_labelCpfCnpj inválido';
                    }
                    return null;
                  },
                  onSaved: (_) {
                    _usuario.cpf = _mascaraCpfCnpj.getUnmaskedText();
                  },
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  focusNode: _focusNome,
                  labelText: _labelNome,
                  controller: _controllerNome,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (!Validador.maisDeUmaPalavra(value)) {
                      return 'Preencha o nome completo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _usuario.nome = value.trim();
                  },
                  onFieldSubmitted: (_) {
                    _focusEmail.requestFocus();
                  },
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  focusNode: _focusEmail,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (_regexEmail.allMatches(value).isEmpty) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _usuario.email = value.toLowerCase();
                  },
                  onFieldSubmitted: (_) => _focusCelular.requestFocus(),
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  focusNode: _focusCelular,
                  labelText: 'Celular',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [_mascaraCelular],
                  validator: (value) {
                    if (!_mascaraCelular.isFill()) {
                      return 'Preencha o celular';
                    }
                    return null;
                  },
                  onSaved: (_) {
                    _usuario.celular = _mascaraCelular.getUnmaskedText();
                  },
                  onChanged: (value) {
                    if (_mascaraCelular.isFill()) {
                      _focusSenha.requestFocus();
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  focusNode: _focusSenha,
                  labelText: 'Senha',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: _controllerSenha,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha a senha';
                    }
                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _usuario.senha = value;
                  },
                  onFieldSubmitted: (_) =>
                      _focusSenhaConfirmacao.requestFocus(),
                ),
                SizedBox(height: 10),
                TextFormFieldPadrao(
                  focusNode: _focusSenhaConfirmacao,
                  labelText: 'Confirmar senha',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.send,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha a confirmação de senha';
                    } else if (value != _controllerSenha.text) {
                      return 'As senhas inseridas não coincidem';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _usuario.senhaConfirmacao = value;
                  },
                  onFieldSubmitted: (_) {
                    _submit();
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BotaoPadrao(
          margin: kMargemPadraoBotaoBottombar,
          textoBotao: Text(
            'Cadastrar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: _submit,
        ),
      ),
    );
  }

  void _submit() async {
    if (!_globalKeyForm.currentState.validate()) {
      return;
    }

    _globalKeyForm.currentState.save();

    setState(() {
      _isCarregando = true;
    });

    String _msgErro;
    try {
      var resultado = await _auth.createUserWithEmailAndPassword(
        email: _usuario.email,
        password: _usuario.senha,
      );

      if (resultado.user != null) {
        _usuario.id = resultado.user.uid;
        await _usuarioDao.createUpdate(_usuario, _fotoUsuario);

        await alertDialog(
          context: context,
          titulo: 'Usuário criado com sucesso',
          conteudo:
              'Comece já a usar o App!',
          primeiroTexto: 'OK',
          primeiroTextoCallback: () {
            unawaited(_auth.signOut());
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      }
    } catch (error) {
      switch (error.code) {
        case 'ERROR_WEAK_PASSWORD':
          _msgErro = 'Senha fraca';
          break;
        case 'ERROR_INVALID_EMAIL':
          _msgErro = 'Email inválido';
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          _msgErro = 'Este email já foi cadastrado';
          break;
        default:
          _msgErro = 'Erro desconhecido.';
      }
    }

    setState(() {
      _isCarregando = false;
    });

    if (_msgErro != null) {
      _globalKeyScaffold.currentState.hideCurrentSnackBar();
      _globalKeyScaffold.currentState.showSnackBar(SnackBar(
        content: (Text(_msgErro)),
      ));
    }
  }

  void _exibirCpfCnpj() {
    showComboBox(
      context: context,
      opcoesCombo: _listaCpfCnpj,
      indiceInicial: _listaCpfCnpj.indexOf(_controllerCpfCnpj.text),
      nomeCampo: 'Documento',
    ).then((value) {
      _alterarCpfCnpj(value);
    });
  }

  void _alterarCpfCnpj(int value) {
    if (value > -1 &&
        _listaCpfCnpj.elementAt(value) != _controllerCpfCnpj.text) {
      _controllerDocumento.clear();
      _controllerNome.clear();
      setState(() {
        _controllerCpfCnpj.text = _listaCpfCnpj.elementAt(value);
        _labelNome = _listaNome.elementAt(value);

        if (value == _Documento.PessoaFisica.index) {
          _mascaraCpfCnpj = MaskTextInputFormatter(mask: kMascaraCpf);
          _labelCpfCnpj = 'CPF';
        } else {
          _mascaraCpfCnpj = MaskTextInputFormatter(mask: kMascaraCnpj);
          _labelCpfCnpj = 'CNPJ';
        }
      });
    }
  }
}
