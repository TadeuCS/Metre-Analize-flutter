import 'package:flutter/material.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class CardCaixaAberto extends StatelessWidget {

  final TotalizadorCaixa caixa;


  CardCaixaAberto(this.caixa);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CardItemHeader(
              tituloLeft: "Caixa "+caixa.situacao,
              tituloRight: OUtils.formataDataHora(OUtils.getDateByJSON(caixa.dtAbertura)),
              decoration: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            CardItemHeader(
              tituloLeft: caixa.turno,
              tituloRight: caixa.operador,
            ),
//            Divider(
//              color: Colors.grey,
//            ),
            CardItemTotalizer(
              descricao: "Entradas:",
              valor: caixa.totalEntradas,
                decorationTitle: TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                decorationValue: TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)
            ),
            CardItemTotalizer(
              descricao: "Saídas:",
              valor: caixa.totalSaidas,
                decorationTitle: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                decorationValue: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)
            ),
            CardItemTotalizer(
              descricao: "Saldo:",
              valor: caixa.saldo,
                decorationTitle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                decorationValue: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)
            ),
          ],
        ),
      ),
    );
  }
}
