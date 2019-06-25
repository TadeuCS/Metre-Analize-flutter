import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';

class VendasPorForma extends StatefulWidget {
  @override
  _VendasPorFormaState createState() => _VendasPorFormaState();
}

class _VendasPorFormaState extends State<VendasPorForma> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VendaBruta(),
        Container(color: Colors.grey,),
      ],
    );
  }
}