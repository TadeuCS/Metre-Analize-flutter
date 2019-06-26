import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class VendaLiquida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardItemTotalizer(
                descricao: "Detalhamento da Venda Liquida",
                decorationTitle: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w600),
                icone: const Icon(
                  Icons.list,
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
              descricao: "(+) Produtos:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(+) Taxa Serviço:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(+) Taxa Entrega:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(+) Acréscimos:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(-) Descontos:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(-) Descontos Promocionais:",
              valor: 0.00,
            ),
            CardItemTotalizer(
              descricao: "(-) Descontos por Cliente:",
              valor: 0.00,
            ),
            Divider(
              color: Colors.grey,
            ),
            CardItemTotalizer(
              descricao: "(=) Total:",
              valor: 1235.0,
              decorationTitle: TextStyle(
                  fontSize: 15.0, fontWeight: FontWeight.w600),
              decorationValue: TextStyle(
                  fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
