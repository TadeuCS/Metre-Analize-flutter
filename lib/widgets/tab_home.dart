import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_caixa_aberto.dart';
import 'package:flutter_app/widgets/chart_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardCaixaAberto(),
      CardCaixaAberto(),
      //VendasPorHorario()
    ]);
  }
}

