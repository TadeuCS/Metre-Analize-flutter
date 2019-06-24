import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_caixa_fechado.dart';

class CaixasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CardCaixaFechado(),
          CardCaixaFechado(),
        ],
      ),
    );
  }
}
