import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/util/Services.dart';
import 'package:flutter_app/widgets/card_caixa_fechado.dart';

class CaixasPage extends StatelessWidget {

  final String turno;
  final int idOperador;
  final DateTime dtIni;
  final DateTime dtFim;

  CaixasPage(this.turno, this.idOperador, this.dtIni, this.dtFim);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: Services().listCaixasEncerrados(idOperador: idOperador, turno: turno, dtIni: dtIni, dtFim: dtFim),
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
                      return CardCaixaFechado(snapshot.data[index]);
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
}
}