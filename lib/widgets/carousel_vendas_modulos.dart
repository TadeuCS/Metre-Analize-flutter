import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';

class CouselVendasPorModulos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildCarousel(context, 0);
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    List<Widget> itensCarousel = List();
    itensCarousel.add(_vendasNoBalcao());
    itensCarousel.add(_vendasNaMesa());
    itensCarousel.add(_vendasNoDelivery());

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

  Widget _vendasNaMesa() {
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
          descricao: "Quantidade Vendas",
          valor: 80,
        ),
        CardItemTotalizer(
          descricao: "Quantidade Pessoas",
          valor: 20,
        ),
        CardItemTotalizer(
          descricao: "Ticket Médio p/ Pessoa",
          valor: 4.0,
        ),
        CardItemTotalizer(
          descricao: "Couvert",
          valor: 35.0,
        ),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total:",
          valor: 500.0,
          decorationTitle:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          decorationValue:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _vendasNoBalcao() {
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
          valor: 80,
        ),
        CardItemTotalizer(
          descricao: "Média de Vendas",
          valor: 20,
        ),
        Divider(
          color: Colors.grey,
        ),
        CardItemTotalizer(
          descricao: "Total:",
          valor: 500.0,
          decorationTitle:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          decorationValue:
              TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _vendasNoDelivery() {
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
        CardItemTotalizer(
          descricao: "Tadeu",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "João Palo",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Renato",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Marvin",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Luis",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Igor",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "James",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Daniel",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
        ),
        CardItemTotalizer(
          descricao: "Rafael",
          valorCenter: 85,
          tipoColumnCenter: int,
          valor: 85,
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
