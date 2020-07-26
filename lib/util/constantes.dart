import 'package:flutter/material.dart';

const kRegexEmail =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const kRegexSenha =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
const kPrimaryColor = Color(0xff4ec585);
const kColorAzulEscuro = Color(0xff4a418f);
const kColorAzulMedio = Color(0xff4e43a7);
const kColorVerdeEscuro = Color(0xff4bc24d);
const kColorTurquesa = Color(0xff51c7bd);
const kColorRosa = Color(0xffd15eaa);


const kMascaraCelular = '(##) #####-####';
const kMascaraCpf = '###.###.###-##';
const kMascaraCnpj = '##.###.###/####-##';
const kPrefKeyEmailUltimoLogin = 'emailUltimoLogin';