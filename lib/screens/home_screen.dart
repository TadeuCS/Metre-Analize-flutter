import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/caixas_page.dart';
import 'package:flutter_app/widgets/dialog_filtro.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _pagesSwap = <Widget>[
    HomePage(), //tab1
    CaixasPage() //tab2
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Tab Selecionada $_selectedIndex");
  }

  _openFilterModal(){
     showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
         return FilterDialog();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Metre Analize'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: _openFilterModal,
            ),
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
        ));
  }
}
