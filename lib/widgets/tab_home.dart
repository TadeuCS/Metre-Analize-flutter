import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/util/Services.dart';
import 'package:flutter_app/widgets/card_caixa_aberto.dart';
import 'package:flutter_app/widgets/chart_bar.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: Services().listCaixasAbertos(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            switch(snapshot.connectionState){
              case ConnectionState.active:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return CardCaixaAberto(snapshot.data[index]);
                    }
                );
              default:
                return Text("Erro ao listar os caixas abertos!");
            }
          }else{
            return Text("Lista Vazia");
          }
        },
      ),
    );
//    return Column(children: <Widget>[
//      CardCaixaAberto(),
//      CardCaixaAberto(),
//      //VendasPorHorario()
//    ]);
  }
}

