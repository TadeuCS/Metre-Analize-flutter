import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorForma.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';
import 'package:scoped_model/scoped_model.dart';

class VendasPorForma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CaixaModel caixaModel=ScopedModel.of<CaixaModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          VendaBruta(),
          VendaLiquida(),
          FutureBuilder(
            future: caixaModel.listTotalizadorFormas(caixaModel.caixaSelecionado.idCaixa),
            builder: (context, snapshot){
              if(snapshot.hasError){
                print(snapshot.error);
                return Text("Erro ao listar os totalizadores por formas");
              }
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }else{
                List<TotalizadorForma> totalizadores = snapshot.data;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CardItemTotalizer(
                            descricao: "Vendas por Formas",
                            decorationTitle:
                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                            icone: const Icon(
                              Icons.attach_money,
                              color: Colors.deepOrangeAccent,
                              size: 30.0,
                            )),
                        Divider(color: Colors.grey,),
                        Column(
                          children: totalizadores.map((tot)=> CardItemTotalizer(descricao: tot.descricao, valor: tot.calculado,)).toList(),
                        ),

                        Divider(color: Colors.grey,),
                        CardItemTotalizer(descricao: "Total:", valor: totalizadores.map((tot)=>tot.calculado).reduce((totalCalculado, valor)=> totalCalculado+valor), decorationTitle: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                          decorationValue: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}