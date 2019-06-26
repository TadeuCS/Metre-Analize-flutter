import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/carousel_vendas_modulos.dart';

class VendasPorModulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          VendaBruta(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CardItemTotalizer(
                      descricao: "Vendas por Módulos",
                      decorationTitle:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                      icone: const Icon(
                        Icons.filter,
                        color: Colors.deepOrangeAccent,
                        size: 30.0,
                      )),
                  Divider(color: Colors.grey,),
                  CardItemTotalizer(descricao: "Balcão", valor: 100.0,),
                  CardItemTotalizer(descricao: "Mesas", valor: 1500.0,),
                  CardItemTotalizer(descricao: "Delivery", valor: 80.0,),
                  Divider(color: Colors.grey,),
                  CardItemTotalizer(descricao: "Total:", valor: 1180.0, decorationTitle: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                    decorationValue: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
          CouselVendasPorModulos()
        ],
      ),
    );
  }
}
