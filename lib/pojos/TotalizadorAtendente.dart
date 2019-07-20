
import 'package:flutter_app/util/OUtils.dart';

class TotalizadorAtendente{

  String atendente;
  double totalTaxaServico;
  double totalProdutos;

  TotalizadorAtendente(this.atendente,this.totalTaxaServico,this.totalProdutos);

  TotalizadorAtendente.fromJson(Map<String, dynamic> json){
    this.atendente=json["atendente"];
    this.totalTaxaServico = OUtils.convertToDouble(json["totalTaxaServico"]);
    this.totalProdutos = OUtils.convertToDouble(json["totalProdutos"]);
  }
}