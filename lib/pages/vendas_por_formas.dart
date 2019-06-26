import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
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
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CardItemTotalizer(
                    descricao: "Vendas por Formas",
                    decorationTitle:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    icone: const Icon(
                      Icons.attach_money,
                      color: Colors.deepOrangeAccent,
                      size: 30.0,
                    )),
                Divider(color: Colors.grey,),
                CardItemTotalizer(descricao: "Dinheiro", valor: 500.0,),
                CardItemTotalizer(descricao: "Cartão", valor: 500.0,),
                CardItemTotalizer(descricao: "Crédito", valor: 0.0,),
                CardItemTotalizer(descricao: "Vale Refeição", valor: 0.0,),
                Divider(color: Colors.grey,),
                CardItemTotalizer(descricao: "Total:", valor: 1000.0, decorationTitle: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
                  decorationValue: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}