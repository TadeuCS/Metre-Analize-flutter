import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/util/Services.dart';
import 'package:flutter_app/widgets/card_caixa_fechado.dart';

class CaixasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: Services().listCaixasEncerrados(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            print(snapshot.error.toString());
            return Text("Erro ao listar os caixas!");
          }
          if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
          }else{
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return CardCaixaFechado(snapshot.data[index]);
                    }
                );
          }
        },
      ),
    );
  }
}