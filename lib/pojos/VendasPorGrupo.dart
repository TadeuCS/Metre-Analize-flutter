import 'package:flutter_app/util/OUtils.dart';

class VendasPorGrupo{
  String _descricao;
  double _total;

  VendasPorGrupo(this._descricao, this._total);

  VendasPorGrupo.fromJson(Map<String, dynamic> json){
    this._descricao=json["descricao"];
    this._total=OUtils.convertToDouble(json["total"]);
  }

  double get total => _total;

  set total(double value) {
    _total = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }


}