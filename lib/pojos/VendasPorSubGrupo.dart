import 'package:flutter_app/util/OUtils.dart';

class VendasPorSubGrupo{
  String _descricao;
  double _total;

  VendasPorSubGrupo(this._descricao, this._total);

  VendasPorSubGrupo.fromJson(Map<String, dynamic> json){
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