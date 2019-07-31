import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorModulo.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:flutter_app/widgets/card_venda_bruta.dart';
import 'package:flutter_app/widgets/carousel_vendas_modulos.dart';
import 'package:scoped_model/scoped_model.dart';

class VendasPorModulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CaixaModel caixaModel = ScopedModel.of<CaixaModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          VendaBruta(),
          FutureBuilder(
              future: caixaModel
                  .listTotalizadorModulos(caixaModel.caixaSelecionado.idCaixa),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text("Erro ao listar os totalizadores por formas");
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  TotalizadorModulo totalizador = snapshot.data;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          CardItemTotalizer(
                              descricao: "Vendas por Módulos",
                              decorationTitle: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                              icone: const Icon(
                                Icons.filter,
                                size: 30.0,
                                color: Colors.deepOrange,
                              )),
                          Divider(
                            color: Colors.grey,
                          ),
                          CardItemTotalizer(
                            descricao: "Balcão",
                            valor: totalizador.totalizadorBalcao.totalVendido,
                          ),
                          CardItemTotalizer(
                            descricao: "Mesas",
                            valor: totalizador.totalizadorMesa.totalVenda,
                          ),
                          CardItemTotalizer(
                            descricao: "Delivery",
                            valor: totalizador.totalizadorDelivery.totalPedidos,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          CardItemTotalizer(
                            descricao: "Total:",
                            valor: totalizador.totalizadorBalcao.totalVendido +
                                totalizador.totalizadorMesa.totalVenda +
                                totalizador.totalizadorDelivery.totalPedidos,
                            decorationTitle: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                            decorationValue: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                          CouselVendasPorModulos(totalizador)
                        ],
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
