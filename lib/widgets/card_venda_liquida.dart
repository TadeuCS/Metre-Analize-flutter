import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/pojos/TotalizadorVendaLiquida.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:scoped_model/scoped_model.dart';

class VendaLiquida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CaixaModel caixaModel = ScopedModel.of<CaixaModel>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: caixaModel.listTotalizadorVendaLiquida(caixaModel.caixaSelecionado.idCaixa),
            builder: (context, snapshot){
              if(snapshot.hasError){
                print(snapshot.error);
                return Text("Erro ao carregar a VendaLiquida");
              }
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }else{
                TotalizadorVendaLiquida vendaLiquida = snapshot.data;
                return Column(
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
                      valor: vendaLiquida.totalProdutos,
                    ),
                    CardItemTotalizer(
                      descricao: "(+) Taxa Serviço:",
                      valor: vendaLiquida.totalTaxaServico,
                    ),
                    CardItemTotalizer(
                      descricao: "(+) Taxa Entrega:",
                      valor: vendaLiquida.totalTaxaEntrega,
                    ),
                    CardItemTotalizer(
                      descricao: "(+) Acréscimos:",
                      valor:  vendaLiquida.totalAcrescimo,
                    ),
                    CardItemTotalizer(
                      descricao: "(-) Descontos:",
                      valor:  vendaLiquida.totalDesconto,
                    ),
                    CardItemTotalizer(
                      descricao: "(-) Descontos Promocionais:",
                      valor:  vendaLiquida.totalDescontoPromocional,
                    ),
                    CardItemTotalizer(
                      descricao: "(-) Descontos por Cliente:",
                      valor:  vendaLiquida.totalDescontoPorCliente,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    CardItemTotalizer(
                      descricao: "(=) Total:",
                      valor:  (vendaLiquida.totalProdutos+vendaLiquida.totalTaxaEntrega+vendaLiquida.totalTaxaServico
                      +vendaLiquida.totalAcrescimo-vendaLiquida.totalDesconto-vendaLiquida.totalDescontoPromocional-vendaLiquida.totalDescontoPorCliente),
                      decorationTitle: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                      decorationValue: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                );
              }
            }
        ),
      ),
    );
  }
}
