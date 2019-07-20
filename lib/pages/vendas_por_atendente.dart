import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorAtendente.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';
import 'package:scoped_model/scoped_model.dart';

class VendasPorAtendente extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    CaixaModel caixaModel = ScopedModel.of<CaixaModel>(context);
    return ListView(
      children: <Widget>[
        VendaBruta(),
        VendaLiquida(),
        FutureBuilder(
            future: caixaModel
                .listTotalizadorAtendente(caixaModel.caixaSelecionado.idCaixa),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Erro ao listar os totalizadores por formas");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData && snapshot.data.length > 0) {
                    List<TotalizadorAtendente> totalizadores = snapshot.data;
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            CardItemTotalizer(
                                descricao: "Vendas por Atendente",
                                decorationTitle: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600),
                                icone: const Icon(
                                  Icons.people,
                                  color: Colors.deepOrangeAccent,
                                  size: 30.0,
                                )),
                            SizedBox(
                              height: 20.0,
                            ),
                            CardItemHeader(
                                tituloLeft: "Atendente",
                                tituloCenter: "Taxa",
                                tituloRight: "Produtos"),
                            Divider(
                              color: Colors.grey,
                            ),
                            Column(
                              children: totalizadores
                                  .map((tot) => CardItemTotalizer(
                                descricao: tot.atendente,
                                valorCenter: tot.totalTaxaServico,
                                valor: tot.totalProdutos,
                              ))
                                  .toList(),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            CardItemTotalizer(
                              descricao: "Total:",
                              valorCenter: totalizadores.map((tot)=>tot.totalTaxaServico).reduce((value, element)=> value+element),
                              valor: totalizadores.map((tot)=>tot.totalProdutos).reduce((totalProdutos, valor)=> totalProdutos+valor),
                              decorationTitle: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                              decorationValue: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("Lista Vazia");
                case ConnectionState.none:
                  return Text("Erro de Conexão!");
                default:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }
            })
      ],
    );
  }
}
