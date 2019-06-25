import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/VendaBruta.dart';
import 'package:flutter_app/pages/vendas_por_atendente.dart';
import 'package:flutter_app/pages/vendas_por_formas.dart';
import 'package:flutter_app/pages/vendas_por_grupos.dart';
import 'package:flutter_app/pages/vendas_por_modulo.dart';
import 'package:flutter_app/pages/vendas_por_produtos.dart';
import 'package:flutter_app/pages/vendas_por_subgrupos.dart';

class DetalhamentoVendaBruta extends StatefulWidget {
  VendaBruta totalizador;

  DetalhamentoVendaBruta(this.totalizador);

  @override
  _DetalhamentoVendaBrutaState createState() => _DetalhamentoVendaBrutaState();
}

class _DetalhamentoVendaBrutaState extends State<DetalhamentoVendaBruta> {
  int _paginaSelecionada = 0;
  PageController _pageController = PageController();

  _showBottomSheep(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _createTile(context, "Vendas por Atendente", Icons.expand_more, 0),
              _createTile(context, "Vendas por Formas", Icons.expand_more, 1),
              _createTile(context, "Vendas por Módulos", Icons.expand_more, 2),
              _createTile(context, "Vendas por Produtos", Icons.expand_more, 3),
              _createTile(context, "Vendas por Grupos", Icons.expand_more, 4),
              _createTile(context, "Vendas por Subgrupos", Icons.expand_more, 5),
            ],
          );
        }
    );
  }

  _animateToPage(BuildContext context,int page){
    Navigator.pop(context);
    _paginaSelecionada = page;
    _pageController.animateToPage(_paginaSelecionada, duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  ListTile _createTile(
      BuildContext context, String name, IconData icon, int page) {
    return ListTile(
      selected: page ==_paginaSelecionada,
      leading: Icon(icon),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      title: Text(name),
      dense: true,
      onTap: (){_animateToPage(context, page);},
      onLongPress: (){_animateToPage(context, page);},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Detalhamento de Caixa"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              VendasPorAtendente(),
              VendasPorForma(),
              VendasPorModulo(),
              VendasPorProdutos(),
              VendasPorGrupos(),
              VendasPorSubGrupos()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            child: Icon(Icons.assignment),
            onPressed: () => _showBottomSheep(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
