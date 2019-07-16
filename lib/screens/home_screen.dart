import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
import 'package:flutter_app/widgets/drawer_sideMenu.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app/widgets/tab_home.dart';
import 'package:flutter_app/widgets/tab_caixas.dart';
import 'package:flutter_app/widgets/dialog_filtro.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  final UsuarioModel _usuarioModel;
  HomeScreen(this._usuarioModel);

  @override
  _HomeScreenState createState() => _HomeScreenState(_usuarioModel);
}

class _HomeScreenState extends State<HomeScreen> {
  final UsuarioModel usuarioModel;

  _HomeScreenState(this.usuarioModel);

  int _selectedIndex = 0;

  CaixaModel caixaModel;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
//    print("Tab Selecionada $_selectedIndex");
  }

  List<Widget> _pagesSwap = <Widget>[
    HomePage(), //tab1
    CaixasPage() //tab2
  ];

  @override
  Widget build(BuildContext context) {
    final CaixaModel caixaModel =
    CaixaModel(usuarioModel.usuarioLogado.authToken);

    _openFilterModal() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return FilterDialog(caixaModel);
          });
    }

    return ScopedModel<CaixaModel>(
        model: caixaModel,
        child: Scaffold(
            drawer: SideMenu(),
            appBar: AppBar(
//          automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.deepOrangeAccent,
              title: Text('Metre Analize'),
              actions: _selectedIndex == 0
                  ? []
                  : <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: _openFilterModal,
                      )
                    ],
            ),
            body: _pagesSwap.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Início'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Caixas'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            )));
  }
}
