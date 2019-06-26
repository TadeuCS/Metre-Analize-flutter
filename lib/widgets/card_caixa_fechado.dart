import 'package:flutter/material.dart';
import 'package:flutter_app/screens/venda_bruta_screen.dart';
import 'package:flutter_app/widgets/button_default.dart';
import 'package:flutter_app/widgets/card_item_description.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class CardCaixaFechado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void _detalharVendaBruta(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhamentoVendaBruta()));
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          CardItemDescription(
            textLeft: "Aguardando Conferência",
            textRight: "29/03/2019 18:02",
            decoration: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          CardItemDescription(
            textLeft: "Turno da Noite",
            textRight: "Tadeu",
          ),
          Divider(
            color: Colors.grey,
          ),
          CardItemTotalizer(
            descricao: "(+) Troco Abertura:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(+) Troco Inserido:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(+) Total Venda Bruta:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(+) Suprimentos:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(+) Recebimentos:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(=) Total Entradas:",
            valor: 0.0,
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
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(-) Pagamentos:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(-) Canelamentos:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(-) Estornos:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(-) Vales R\$:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(-) Troco Retirado:",
            valor: 0.0,
          ),
          CardItemTotalizer(
            descricao: "(=) Total Saídas:",
            valor: 0.0,
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
              valor: 0.0,
              decorationTitle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              decorationValue:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
          ButtomDefault("Detalhar Venda Bruta", _detalharVendaBruta)
        ]),
      ),
    );
  }
}
