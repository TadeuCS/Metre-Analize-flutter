import 'package:flutter_app/util/OUtils.dart';

class VendasPorProduto{
  double quantidade;
  String descricao;
  double total;

  VendasPorProduto(this.quantidade, this.descricao, this.total);

  VendasPorProduto.fromJson(Map<String, dynamic> json){
    this.quantidade=OUtils.convertToDouble(json["quantidade"]);
    this.descricao=json["descricao"];
    this.total=OUtils.convertToDouble(json["total"]);
  }

}