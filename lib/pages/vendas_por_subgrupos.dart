import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/VendasPorSubGrupo.dart';
import 'package:flutter_app/widgets/button_circle.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';
import 'package:scoped_model/scoped_model.dart';

class VendasPorSubGrupos extends StatefulWidget {
  @override
  _VendasPorSubGruposState createState() => _VendasPorSubGruposState();
}

class _VendasPorSubGruposState extends State<VendasPorSubGrupos> {
  int _limitResultados=5;
  int _maxLength;

  @override
  Widget build(BuildContext context) {
    CaixaModel caixaModel = ScopedModel.of<CaixaModel>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          VendaBruta(),
          VendaLiquida(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CardItemTotalizer(
                      descricao: "Vendas por Subgrupos",
                      decorationTitle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                      icone: const Icon(
                        Icons.expand_more,
                        color: Colors.deepOrangeAccent,
                        size: 30.0,
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: ButtonCircle("Top 5", ()=>_showTop(5)),),
                        Expanded(child: ButtonCircle("Top 10", ()=>_showTop(10)),),
                        Expanded(child: ButtonCircle("Top 15", ()=>_showTop(15)),),
                        Expanded(child: ButtonCircle("Todos",()=> _showTop(10000)),),
                      ],
                    ),
                  ),
                  CardItemHeader(
                      tituloLeft: "Subgrupo",
                      tituloRight: "Total"),
                  Divider(
                    color: Colors.grey,
                  ),
                  FutureBuilder(
                      future: caixaModel.listTotalizadorPorSubGrupos(
                          caixaModel.caixaSelecionado.idCaixa),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text(
                              "Erro ao listar as Vendas por grupos");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            if (snapshot.hasData && snapshot.data.length > 0) {
                              List<VendasPorSubGrupo> subGrupos =
                                  snapshot.data;
                              _maxLength=subGrupos.length;
                              return Column(
                                children: <Widget>[
                                  Column(
                                    children: subGrupos.sublist(0, _limitResultados)
                                        .map((subgrupo) => CardItemTotalizer(
                                      descricao: subgrupo.descricao,
                                      valor: subgrupo.total,
                                      tipoColumnCenter: int,
                                    )).toList(),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  CardItemTotalizer(
                                    descricao: "Total:",
                                    valor: subGrupos.map((p)=>p.total).reduce((valorTotal, valor)=>valorTotal+valor),
                                    decorationTitle:
                                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                                    decorationValue:
                                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                                  )
                                ],
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
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showTop(int limitSelecionado) {
    setState(() {
      _limitResultados = (limitSelecionado<_maxLength?limitSelecionado:_maxLength);
    });
  }
}
