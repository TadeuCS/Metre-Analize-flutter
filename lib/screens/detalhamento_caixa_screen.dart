import 'package:flutter/material.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:flutter_app/widgets/card_caixa_fechado.dart';

class DetalhamentoCaixaEncerrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhamento do Caixa"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.open_with,),
              onPressed: (){
                Navigator.pushNamed(context, "/vendaBruta");
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            CardCaixaFechado(Session().caixaModel.caixaSelecionado)
          ],
        ));
  }
}
