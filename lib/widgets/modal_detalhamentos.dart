import 'package:flutter/material.dart';
import 'package:flutter_app/pages/vendas_por_atendente.dart';
import 'package:flutter_app/pages/vendas_por_formas.dart';
import 'package:flutter_app/pages/vendas_por_grupos.dart';
import 'package:flutter_app/pages/vendas_por_modulo.dart';
import 'package:flutter_app/pages/vendas_por_produtos.dart';
import 'package:flutter_app/pages/vendas_por_subgrupos.dart';

class DetalhamentosModal extends StatelessWidget {

  ListTile _createTile(BuildContext context, String name,
       IconData icon, VoidCallback action) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  _goToPage(BuildContext context, Widget novaPagina){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>novaPagina));
  }

  @override
  Widget build(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(
                  context,
                  "Vendas por Atendente",
                  Icons.person,
                (){_goToPage(context, VendasPorAtendente());},
              ),
              _createTile(
                  context,
                  "Vendas por Formas",
                  Icons.person,
                  (){_goToPage(context, VendasPorForma());}),
              _createTile(
                  context,
                  "Vendas por Módulos",
                  Icons.person,
                  (){_goToPage(context, VendasPorModulo());}),
              _createTile(
                  context,
                  "Vendas por Produtos",
                  Icons.person,
                  (){_goToPage(context, VendasPorProdutos());}),
              _createTile(
                  context,
                  "Vendas por Grupos",
                  Icons.person,
                  (){_goToPage(context, VendasPorGrupos());}),
              _createTile(
                  context,
                  "Vendas por Subgrupos",
                  Icons.person,
                  (){_goToPage(context, VendasPorSubGrupos());}),
            ],
          );
        });
    return Container();
  }
}