import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/VendasPorProduto.dart';
import 'package:flutter_app/widgets/button_circle.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/card_venda_liquida.dart';
import 'package:scoped_model/scoped_model.dart';

class VendasPorProdutos extends StatefulWidget {
  @override
  _VendasPorProdutosState createState() => _VendasPorProdutosState();
}

class _VendasPorProdutosState extends State<VendasPorProdutos> {
  int _limitResultados = 5;
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
                      descricao: "Vendas por Produtos",
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
                        Expanded(
                          child: ButtonCircle("Top 5", () => _showTop(5)),
                        ),
                        Expanded(
                          child: ButtonCircle("Top 10", () => _showTop(10)),
                        ),
                        Expanded(
                          child: ButtonCircle("Top 15", () => _showTop(15)),
                        ),
                        Expanded(
                            child: ButtonCircle("Todos", () => _showTop(10000)))
                      ],
                    ),
                  ),
                  CardItemHeader(
                      tituloLeft: "Produto",
                      tituloCenter: "Quantidade",
                      tituloRight: "Total"),
                  Divider(
                    color: Colors.grey,
                  ),
                  FutureBuilder(
                      future: caixaModel.listTotalizadorPorProdutos(
                          caixaModel.caixaSelecionado.idCaixa),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text("Erro ao listar as Vendas por Produtos");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            if (snapshot.hasData && snapshot.data.length > 0) {
                              List<VendasPorProduto> produtos = snapshot.data;
                              _maxLength = produtos.length;
                              print('Max: $_maxLength');
                              print('Limit: $_limitResultados');
                              return Column(
                                children: <Widget>[
                                  Column(
                                    children: produtos
                                        .sublist(
                                            0,
                                            _maxLength < _limitResultados
                                                ? _maxLength
                                                : _limitResultados)
                                        .map((produto) => CardItemTotalizer(
                                              descricao: produto.descricao,
                                              valorCenter: produto.quantidade,
                                              valor: produto.total,
                                              tipoColumnCenter: int,
                                            ))
                                        .toList(),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  CardItemTotalizer(
                                    descricao: "Total:",
                                    valorCenter: produtos
                                        .map((p) => p.quantidade)
                                        .reduce((qtdeTotal, qtde) =>
                                            qtdeTotal + qtde),
                                    tipoColumnCenter: int,
                                    valor: produtos.map((p) => p.total).reduce(
                                        (valorTotal, valor) =>
                                            valorTotal + valor),
                                    decorationTitle: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
                                    decorationValue: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
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

  _showTop(int _limitSelecionado) {
    setState(() {
      _limitResultados =
          (_limitSelecionado < _maxLength ? _limitSelecionado : _maxLength);
    });
  }
}
