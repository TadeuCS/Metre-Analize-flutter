import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';

class VendasPorProdutos extends StatelessWidget {
  List<Widget> lista =List();


  VendasPorProdutos(){
    _listProdutos();
  }

  List<Widget> _listProdutos(){
    for(int i=1;i<=10;i++){
        lista.add(CardItemTotalizer(
          descricao: 'Produto $i',
          valorCenter: 1,
          tipoColumnCenter: int,
          valor: 10.0,
        )
      );
    }
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          VendaBruta(),
          VendaLiquida(),
          Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CardItemTotalizer(
                        descricao: "Vendas por Produtos",
                        decorationTitle: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                        icone: const Icon(
                          Icons.expand_more,
                          color: Colors.deepOrangeAccent,
                          size: 30.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    CardItemHeader(
                        tituloLeft: "Produto",
                        tituloCenter: "Quantidade",
                        tituloRight: "Total"),
                    Divider(
                      color: Colors.grey,
                    ),
                    Column(
                      children: _listProdutos()
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    CardItemTotalizer(
                      descricao: "Total:",
                      valorCenter: 15.0,
                      tipoColumnCenter: int,
                      valor: 500.0,
                      decorationTitle:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                      decorationValue:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
