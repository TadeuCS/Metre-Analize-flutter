import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_caixa_aberto.dart';
import 'package:flutter_app/widgets/chart_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardCaixaAberto(),
      CardCaixaAberto(),
      //VendasPorHorario()
    ]);
  }
}
