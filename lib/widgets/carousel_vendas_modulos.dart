import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/TotalizadorBalcao.dart';
import 'package:flutter_app/pojos/TotalizadorDelivery.dart';
import 'package:flutter_app/pojos/TotalizadorMesa.dart';
import 'package:flutter_app/pojos/TotalizadorModulo.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class CouselVendasPorModulos extends StatelessWidget {
  final TotalizadorModulo _totalizadorModulo;

  CouselVendasPorModulos(this._totalizadorModulo);

  @override
  Widget build(BuildContext context) {
    return _buildCarousel(context, 0);
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    List<Widget> itensCarousel = List();
    if(_totalizadorModulo.totalizadorBalcao.totalVendido>0) {
      itensCarousel.add(_vendasNoBalcao(_totalizadorModulo.totalizadorBalcao));
    }
    if(_totalizadorModulo.totalizadorMesa.totalVenda>0) {
      itensCarousel.add(_vendasNaMesa(_totalizadorModulo.totalizadorMesa));
    }
    if(_totalizadorModulo.totalizadorDelivery.totalPedidos>0) {
      itensCarousel
          .add(_vendasNoDelivery(_totalizadorModulo.totalizadorDelivery));
    }

    return SizedBox(
      height: 210,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: itensCarousel.length,
        itemBuilder: (BuildContext context, int itemIndex) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: itensCarousel[itemIndex],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _vendasNaMesa(TotalizadorMesa totalizadorMesa) {
    return Column(
      children: <Widget>[
        CardItemTotalizer(
            descricao: "Mesas",
            decorationTitle:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            icone: const Icon(
              Icons.expand_more,
              color: Colors.deepOrangeAccent,
              size: 30.0,
            )),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total Vendas",
          valor: totalizadorMesa.totalVenda,
        ),
        CardItemTotalizer(
          descricao: "Quantidade Vendas",
          valor: totalizadorMesa.qtdeVendas + 0.0,
        ),
        CardItemTotalizer(
          descricao: "Quantidade Pessoas",
          valor: totalizadorMesa.qtdePessoas + 0.0,
        ),
        CardItemTotalizer(
          descricao: "Ticket Médio p/ Pessoa",
          valor: totalizadorMesa.qtdePessoas > 0
              ? totalizadorMesa.totalVenda / totalizadorMesa.qtdePessoas
              : 0,
        ),
        CardItemTotalizer(
          descricao: "Taxa Serviço",
          valor: totalizadorMesa.taxaServico,
        ),
        CardItemTotalizer(
          descricao: "Couvert",
          valor: totalizadorMesa.couvert,
        ),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total:",
          valor: totalizadorMesa.totalVenda,
          decorationTitle:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          decorationValue:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _vendasNoBalcao(TotalizadorBalcao totalizadorBalcao) {
    return Column(
      children: <Widget>[
        CardItemTotalizer(
            descricao: "Balcão",
            decorationTitle:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            icone: const Icon(
              Icons.expand_more,
              color: Colors.deepOrangeAccent,
              size: 30.0,
            )),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Quantidade Vendas",
          valor: totalizadorBalcao.qtdePedidos.roundToDouble(),
        ),
        CardItemTotalizer(
          descricao: "Média de Vendas",
          valor: totalizadorBalcao.qtdePedidos > 0
              ? totalizadorBalcao.totalVendido / totalizadorBalcao.qtdePedidos
              : 0,
        ),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total:",
          valor: totalizadorBalcao.totalVendido,
          decorationTitle:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          decorationValue:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _vendasNoDelivery(TotalizadorDelivery totalizadorDelivery) {
    return Column(
      children: <Widget>[
        CardItemTotalizer(
            descricao: "Delivery",
            decorationTitle:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            icone: const Icon(
              Icons.expand_more,
              color: Colors.deepOrangeAccent,
              size: 30.0,
            )),
        SizedBox(
          height: 10.0,
        ),
        CardItemHeader(
            tituloLeft: "Entregador",
            tituloCenter: "Quantidade",
            tituloRight: "Taxa"),
        Divider(
          color: Colors.grey,
        ),
        Column(
          children: totalizadorDelivery.totalizadorEntregador
              .map(
                (tot) => CardItemTotalizer(
                  descricao: tot.nome,
                  valorCenter: tot.qtde.roundToDouble(),
                  tipoColumnCenter: int,
                  valor: tot.taxa,
                ),
              )
              .toList(),
        ),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total:",
          valorCenter: 90,
          tipoColumnCenter: int,
          valor: 500.0,
          decorationTitle:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          decorationValue:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
