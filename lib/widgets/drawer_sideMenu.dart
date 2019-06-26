import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  String _usuarioLogado = "Tadeu";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 5.0,),
                Text('Metre Analize',textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 28.0),),
                Text('Bem Vindo: $_usuarioLogado',textAlign: TextAlign.left, style: TextStyle(color: Colors.white70, fontSize: 18.0),)
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),
          ),
          ListTile(
            title: Text('Início'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
//          ListTile(
//            title: Text('Configurações'),
//            onTap: () {
//              // Update the state of the app.
//              // ...
//            },
//          ),
          ListTile(
            title: Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
