import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:scoped_model/scoped_model.dart';

class VendaBruta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TotalizadorCaixa caixa = ScopedModel.of<CaixaModel>(context).caixaSelecionado;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardItemTotalizer(
                descricao: "Venda Bruta",
                decorationTitle: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w600),
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
              valor: caixa.vendasBruta,
            ),
            CardItemTotalizer(
              descricao: "(-) Cancelamentos:",
              valor: caixa.cancelamentos,
            ),
            CardItemTotalizer(
              descricao: "(-) Estornos:",
              valor: caixa.estornos,
            ),
            Divider(
              color: Colors.grey,
            ),
            CardItemTotalizer(
              descricao: "(=) Venda Liquida:",
              valor: (caixa.vendasBruta-caixa.cancelamentos-caixa.estornos),
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