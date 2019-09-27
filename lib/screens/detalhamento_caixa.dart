import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pages/vendas_por_atendente.dart';
import 'package:flutter_app/pages/vendas_por_formas.dart';
import 'package:flutter_app/pages/vendas_por_grupos.dart';
import 'package:flutter_app/pages/vendas_por_modulo.dart';
import 'package:flutter_app/pages/vendas_por_produtos.dart';
import 'package:flutter_app/pages/vendas_por_subgrupos.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:scoped_model/scoped_model.dart';

class DetalhamentoCaixa extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Detalhamento do Caixa"),
        ),
        body: ScopedModel<CaixaModel>(
          model: Session().caixaModel,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                VendasPorForma(),
                VendasPorAtendente(),
                VendasPorModulo(),
                VendasPorProdutos(),
                VendasPorGrupos(),
                VendasPorSubGrupos()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            child: Icon(Icons.assignment),
            onPressed: () => _showBottomSheep(context, currentPage)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }

  _showBottomSheep(BuildContext context, int currentPage) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  _createTile(
                      context, "Vendas por Formas", Icons.expand_more, 0, currentPage),
                  _createTile(
                      context, "Vendas por Atendente", Icons.expand_more, 1, currentPage),
                  _createTile(
                      context, "Vendas por Módulos", Icons.expand_more, 2, currentPage),
                  _createTile(
                      context, "Vendas por Produtos", Icons.expand_more, 3, currentPage),
                  _createTile(
                      context, "Vendas por Grupos", Icons.expand_more, 4, currentPage),
                  _createTile(
                      context, "Vendas por Subgrupos", Icons.expand_more, 5, currentPage),
                ],
              ),
            );
          });
    }
      ListTile _createTile(
          BuildContext context, String name, IconData icon, int page, int currentPage) {
        return ListTile(
          selected: page == currentPage,
          leading: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          title: Text(name),
          dense: true,
          onTap: () {
            _animateToPage(context, page, currentPage);
          },
          onLongPress: () {
            _animateToPage(context, page, currentPage);
          },
        );
      }

      _animateToPage(BuildContext context, int page, int currentPage) {
        Navigator.pop(context);
        currentPage = page;
        _pageController.animateToPage(currentPage,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      }
}
