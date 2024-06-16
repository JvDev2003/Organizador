import 'package:flutter/material.dart';
import 'package:organizador/pages/processar_page.dart';
import 'package:organizador/pages/registrar_contaAgua.dart';
import 'package:organizador/pages/registrar_contaEnergia_page.dart';
import 'package:organizador/pages/registrar_cpf_page.dart';
import 'package:organizador/pages/registrar_rg_page.dart';
import 'package:organizador/pages/selecao_registro_page.dart';
import 'package:organizador/pages/cadastrar_page.dart';
import 'package:organizador/pages/login_page.dart';
import 'package:organizador/pages/principal_page.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (context) => TelaLogin(),
          '/cadastrar': (context) => TelaCadastrar(),
          '/principal': (context) => const Principal(),
          '/selecaoRegistro': (context) => TelaSelecaoRegistro(),
          '/registrar/cpf': (context) => const TelaRegistrarCPF(),
          '/registrar/rg': (cotenxt) => const TelaRegistrarRG(),
          '/registrar/contadeenergia': (context) => const TelaRegistrarContaEnergia(),
          '/registrar/contadeágua': (cotenxt) => const TelaRegistrarContaAgua(),
          '/processar': (context) => const TelaFotoProcessada(),
        },
    );
  }
}