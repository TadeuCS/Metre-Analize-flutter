import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/util/Session.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app/widgets/tab_home.dart';
import 'package:flutter_app/widgets/tab_caixas.dart';
import 'package:flutter_app/widgets/dialog_filtro.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexTab = 0;

  List<Widget> _pagesSwap = <Widget>[
    HomePage(), //tab1
    CaixasPage() //tab2
  ];

  @override
  Widget build(BuildContext context) {
    Session().caixaModel =
        CaixaModel(Session().usuarioModel.usuarioLogado.authToken);

    _changeTab(int index) {
      setState(() {
        _indexTab = index;
      });
    }

    _openFilterModal() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return FilterDialog();
          });
    }

    return ScopedModel<CaixaModel>(
        model: Session().caixaModel,
        child: Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        CircleAvatar(
                          minRadius: 30,
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          'Bem Vindo: ${Session().usuarioModel.usuarioLogado.usuario}',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  ListTile(
                    title: Text('Caixas Abertos'),
                    leading: Icon(Icons.blur_on),
                    selected: _indexTab == 0,
                    onTap: () {
                      _changeTab(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Caixas Encerrados'),
                    leading: Icon(Icons.blur_off),
                    selected: _indexTab == 1,
                    onTap: () {
                      _changeTab(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Configurações'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Sair'),
                    leading: Icon(Icons.power_settings_new),
                    onTap: () async {
                      /*
                        * Tratar para ao fazer logoff limpar os dados do usuário
                        * salvos na memória do celular, e limpar as variáveis salvas
                        * na Session().
                       */
                      Session().usuarioModel=null;
                      Session().caixaModel=null;
                      await Session().prefs.remove("usuario");
                      await Session().prefs.remove("senha");
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.deepOrangeAccent,
              title:
                  Text(_indexTab == 0 ? "Caixas Abertos" : "Caixas Encerrados"),
              actions: _indexTab == 0
                  ? []
                  : <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: _openFilterModal,
                      )
                    ],
            ),
            body: _pagesSwap.elementAt(_indexTab),
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
              currentIndex: _indexTab,
              selectedItemColor: Colors.amber[800],
              onTap: _changeTab,
            )));
  }
}
