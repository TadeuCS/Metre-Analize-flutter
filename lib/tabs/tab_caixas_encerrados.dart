import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:flutter_app/widgets/card_item_header.dart';
import 'package:flutter_app/widgets/card_item_totalizer.dart';
import 'package:scoped_model/scoped_model.dart';

class CaixaEncerradoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CaixaModel>(builder: (context, child, model) {
      return FutureBuilder(
        future: model.listCaixasEncerrados(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Text("Erro ao listar os caixas!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data.length > 0) {
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      TotalizadorCaixa caixa = snapshot.data[index];
                      return _listTileCaixaEncerrado(caixa, model, context);
                    });
              }
              return Container();
            case ConnectionState.none:
              return Text("Erro de Conexão!");
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      );
    });
  }

  Card _listTileCaixaEncerrado(
      TotalizadorCaixa caixa, CaixaModel model, BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        dense: true,
        title: Wrap(
          children: <Widget>[
            CardItemHeader(
              tituloLeft: caixa.situacao,
              tituloRight: OUtils.formataDataHora(
                  OUtils.getDateByJSON(caixa.dtAbertura)),
              decoration:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            CardItemHeader(
              decoration:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              tituloLeft: caixa.operador,
              tituloRight: caixa.turno,
            ),
            Divider(
              color: Colors.grey,
            ),
            CardItemTotalizer(
              descricao: "Saldo:",
              valor: caixa.saldo,
              decorationTitle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
              decorationValue: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
        onTap: () {
          model.caixaSelecionado = caixa;
          Session().caixaModel = model;
          Navigator.pushNamed(context, '/caixa');
        },
      ),
    );
  }
}
