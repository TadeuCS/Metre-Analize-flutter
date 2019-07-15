import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/util/Services.dart';
import 'package:scoped_model/scoped_model.dart';

class CaixaModel extends Model {
  int idOperador;
  String turno;
  DateTime dtIni;
  DateTime dtFin;

  List<TotalizadorCaixa> caixasFiltrados;


  CaixaModel(){
    caixasFiltrados=List();
  }

  void filterCaixas() async{
    caixasFiltrados = await Services().listCaixasAbertos();
    print("Caixas Filtrados: "+caixasFiltrados.length.toString());
    notifyListeners();
  }

}