import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class VendaBruta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardItemTotalizer(
                descricao: "Detalhamento da Venda Bruta",
                decorationTitle: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
                icone: const Icon(
                  Icons.monetization_on,
                  color: Colors.deepOrangeAccent,
                  size: 30.0,
                )),
            SizedBox(
              height: 10.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            CardItemTotalizer(
              descricao: "(+) Venda Bruta:",
              valor: 1235.00,
            ),
            CardItemTotalizer(
              descricao: "(-) Cancelamentos:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(-) Estornos:",
              valor: 0.00,
            ),
            Divider(
              color: Colors.grey,
            ),
            CardItemTotalizer(
              descricao: "(=) Total Entradas:",
              valor: 1235.0,
              decorationTitle: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.w600),
              decorationValue: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
