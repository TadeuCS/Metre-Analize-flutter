import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/widgets/card_caixa_aberto.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CaixaModel>(
      builder: (context, child, model){
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
              future: model.listCaixasAbertos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Text("Erro ao listar os caixas!");
                }
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(),);
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardCaixaAberto(snapshot.data[index]);
                      }
                  );
                }
              }
          ),
        );
      },
    );
  }
}

