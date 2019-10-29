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

class DetalhamentoVendaBruta extends StatefulWidget {
  @override
  _DetalhamentoVendaBrutaState createState() => _DetalhamentoVendaBrutaState();
}

class _DetalhamentoVendaBrutaState extends State<DetalhamentoVendaBruta> {
  final _pageController = PageController(initialPage: 0, keepPage: true);
  int currentPage;

  @override
  void initState() {
    currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Venda Bruta"),
        ),
        body: ScopedModel<CaixaModel>(
          model: Session().caixaModel,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                pageChanged(index);
              },
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

  void pageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  _showBottomSheep(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                _createTile(context, "Vendas por Formas", Icons.expand_more, 0),
                _createTile(
                    context, "Vendas por Atendente", Icons.expand_more, 1),
                _createTile(
                    context, "Vendas por Módulos", Icons.expand_more, 2),
                _createTile(
                    context, "Vendas por Produtos", Icons.expand_more, 3),
                _createTile(context, "Vendas por Grupos", Icons.expand_more, 4),
                _createTile(
                    context, "Vendas por Subgrupos", Icons.expand_more, 5),
              ],
            ),
          );
        });
  }

  ListTile _createTile(
      BuildContext context, String name, IconData icon, int page) {
    return ListTile(
      selected: page == currentPage,
      leading: Icon(icon),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      title: Text(name),
      dense: true,
      onTap: () {
        _animateToPage(context, page);
      },
      onLongPress: () {
        _animateToPage(context, page);
      },
    );
  }

  _animateToPage(BuildContext context, int page) {
    _pageController.animateToPage(page,
        duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
    Navigator.pop(context);
  }
}
