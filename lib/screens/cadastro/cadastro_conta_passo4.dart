import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:megahacktecban/components/botao_padrao.dart';
import 'package:megahacktecban/components/indicador_progresso_cadastro.dart';
import 'package:megahacktecban/model/usuario_model.dart';
import 'package:megahacktecban/screens/cadastro/cadastro_conta_passo5.dart';
import 'package:megahacktecban/util/constantes.dart';

class CadastroContaPasso4 extends StatefulWidget {
  static String id = 'cadastro_conta_passo4';

  @override
  _CadastroContaPasso4State createState() => _CadastroContaPasso4State();
}

class _CadastroContaPasso4State extends State<CadastroContaPasso4> {
  final _estiloTexto = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
  final _keyScaffold = GlobalKey<ScaffoldState>();
  UsuarioModel _usuario;
  bool _isAutorizado = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _usuario = args['usuario'];
    return Scaffold(
      key: _keyScaffold,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
          bottom: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IndicadorProgressoCadastro(
                  qtdPassos: 3,
                  passoAtual: 3,
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
                    'Precisamos da sua autorização para finalizar.',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Com a autorização, fica permitido somente a análise e armazenamento dos dados transacionais para maior eficiência da plataforma.',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _isAutorizado,
                        onChanged: (value) {
                          setState(() {
                            _isAutorizado = value;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Autorizo o Best4U a acessar',
                            style: _estiloTexto,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'meus dados financeiros ',
                                style: _estiloTexto,
                              ),
                              Text(
                                'apenas',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Text(
                            'em modo de visualização.',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w900),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            BotaoPadrao(
              textoBotao: Text(
                'Conectar conta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              corBotao: kColorAzulMedio,
              onPressed: _isAutorizado
                  ? () => Navigator.of(context)
                          .pushNamed(CadastroContaPasso5.id, arguments: {
                        'usuario': _usuario,
                      })
                  : null,
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
            SizedBox(height: 10),
            BotaoPadrao(
              textoBotao: Text(
                'Escolher outro banco',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: kColorAzulMedio,
                  fontSize: 20,
                ),
              ),
              isBotaoSemCor: true,
            ),
          ],
        ),
      ),
    );
  }
}
