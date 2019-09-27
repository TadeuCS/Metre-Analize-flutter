
import 'package:flutter_app/util/OUtils.dart';

class VendasPorSubGrupo{
  String descricao;
  double total;

  VendasPorSubGrupo(this.descricao, this.total);

  VendasPorSubGrupo.fromJson(Map<String, dynamic> json){
    this.descricao=json["descricao"];
    this.total= OUtils.convertToDouble(json["total"]);
  }

}