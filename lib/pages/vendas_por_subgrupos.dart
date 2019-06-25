import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';

class VendasPorSubGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VendaBruta(),
        Container(color: Colors.purple,),
      ],
    );
  }
}
