import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/VendaBruta.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class DetalhamentoVendaBruta extends StatefulWidget {

  VendaBruta totalizador;


  DetalhamentoVendaBruta(this.totalizador);

  @override
  _DetalhamentoVendaBrutaState createState() => _DetalhamentoVendaBrutaState();

}

class _DetalhamentoVendaBrutaState extends State<DetalhamentoVendaBruta> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                CardItemTotalizer(descricao: "Detalhamento Venda Bruta", icone: Icons.settings_overscan,),
                CardItemTotalizer(descricao: "Venda Bruta:", valor: 1235.00,),
                CardItemTotalizer(descricao: "Cancelamentos:", valor: 0.00,),
                CardItemTotalizer(descricao: "Estornos:", valor: 0.00,),
                Divider(color: Colors.grey,),
                CardItemTotalizer(descricao: "Venda Liquida:", valor: 1235.00,),
                RaisedButton(child: Text(
                    "Vendas por Forma"),
                  onPressed: (){},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

