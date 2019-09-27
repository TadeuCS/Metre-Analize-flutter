import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/pojos/TotalizadorForma.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:flutter_app/widgets/button_raised.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:scoped_model/scoped_model.dart';

class CardCaixaFechado extends StatelessWidget {

  final TotalizadorCaixa caixa;

  CardCaixaFechado(this.caixa);

  @override
  Widget build(BuildContext context) {
    _detalharVendaBruta(){
      Session().caixaModel=ScopedModel.of<CaixaModel>(context);
      Session().caixaModel.caixaSelecionado = this.caixa;
      Navigator.pushNamed(context, "/caixa");
    }
    List<TotalizadorForma> totalizadoresPorForma=caixa.totalizadores
        .where((tot)=>tot.calculado>0)
        .toList();
    return Card(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          CardItemHeader(
            tituloLeft: caixa.situacao,
            tituloRight: OUtils.formataDataHora(OUtils.getDateByJSON(caixa.dtAbertura)),
            decoration: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          CardItemHeader(
            tituloLeft: caixa.turno,
            tituloRight: caixa.operador,
          ),
          Divider(
            color: Colors.grey,
          ),
          CardItemTotalizer(
            descricao: "(+) Troco Abertura:",
            valor: caixa.trocoAbertura,
          ),
          CardItemTotalizer(
            descricao: "(+) Troco Inserido:",
            valor: caixa.trocoInserido,
          ),
          CardItemTotalizer(
            descricao: "(+) Total Venda Bruta:",
            valor: caixa.vendasBruta,
          ),
          CardItemTotalizer(
            descricao: "(+) Suprimentos:",
            valor: caixa.sangrias,
          ),
          CardItemTotalizer(
            descricao: "(+) Recebimentos:",
            valor: caixa.recebimentos,
          ),
          CardItemTotalizer(
            descricao: "(=) Total Entradas:",
            valor: caixa.totalEntradas,
            decorationTitle: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
            decorationValue: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
          CardItemTotalizer(
            descricao: "(-) Sangria:",
            valor: caixa.sangrias,
          ),
          CardItemTotalizer(
            descricao: "(-) Pagamentos:",
            valor: caixa.pagamentos,
          ),
          CardItemTotalizer(
            descricao: "(-) Canelamentos:",
            valor: caixa.cancelamentos,
          ),
          CardItemTotalizer(
            descricao: "(-) Estornos:",
            valor: caixa.estornos,
          ),
          CardItemTotalizer(
            descricao: "(-) Vales R\$:",
            valor: caixa.vales,
          ),
          CardItemTotalizer(
            descricao: "(-) Troco Retirado:",
            valor: caixa.trocoRetirado,
          ),
          CardItemTotalizer(
            descricao: "(=) Total Saídas:",
            valor: caixa.totalSaidas,
            decorationTitle: TextStyle(
                color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.w600),
            decorationValue: TextStyle(
                color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          Divider(
            color: Colors.grey,
          ),
          CardItemTotalizer(
              descricao: "(=) Saldo:",
              valor: caixa.saldo,
              decorationTitle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              decorationValue:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),

        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: CardItemTotalizer(
            descricao: "Totalizador por Forma",
            decorationTitle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            icone: Icon(Icons.keyboard_arrow_down),),
        ),
          CardItemHeader(
            tituloLeft: "Forma",
            tituloCenter: "Valor Informado",
            tituloRight: "Valor Conferido",
          ),
          Column(
            children: totalizadoresPorForma
                .map((tot)=>
                CardItemTotalizer(descricao: tot.descricao, tipoColumnCenter: double, valorCenter: tot.informado, valor:  tot.calculado,)).toList(),
          ),
          Divider(),
          CardItemTotalizer(
            descricao: "Total:",
            tipoColumnCenter: double,
            valorCenter: totalizadoresPorForma.map((tot)=>tot.informado).reduce((total, valor)=>total+valor),
            valor: totalizadoresPorForma.map((tot)=>tot.calculado).reduce((total, valor)=>total+valor),),
          ButtomDefault("Detalhar Venda Bruta", _detalharVendaBruta)
        ]),
      ),
    );
  }

}
