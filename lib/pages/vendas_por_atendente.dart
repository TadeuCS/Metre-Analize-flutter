import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';

class VendasPorAtendente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        VendaBruta(),
        VendaLiquida(),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CardItemTotalizer(
                    descricao: "Vendas por Atendente",
                    decorationTitle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    icone: const Icon(
                      Icons.people,
                      color: Colors.deepOrangeAccent,
                      size: 30.0,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                CardItemHeader(tituloLeft: "Atendente", tituloCenter: "Taxa", tituloRight: "Produtos"),
                Divider(color: Colors.grey,),
                CardItemTotalizer(descricao: "Tadeu", valorCenter: 121.0, valor: 0.0,),
                CardItemTotalizer(descricao: "João", valorCenter: 8.0, valor: 0.0,),
                CardItemTotalizer(descricao: "Marvin", valorCenter: 70.0, valor: 0.0,),
                CardItemTotalizer(descricao: "Renato", valorCenter: 100.0, valor: 0.0,),
                Divider(color: Colors.grey,),
                CardItemTotalizer(descricao: "Total:", valorCenter: 1000.0, valor: 1000.0, decorationTitle: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
                  decorationValue: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
