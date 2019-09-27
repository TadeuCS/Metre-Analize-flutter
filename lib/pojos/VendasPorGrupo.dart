import 'package:flutter_app/util/OUtils.dart';

class VendasPorGrupo{
  String descricao;
  double total;

  VendasPorGrupo(this.descricao, this.total);

  VendasPorGrupo.fromJson(Map<String, dynamic> json){
    this.descricao=json["descricao"];
    this.total=OUtils.convertToDouble(json["total"]);
  }

}