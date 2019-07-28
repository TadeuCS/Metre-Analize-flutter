import 'package:flutter_app/util/OUtils.dart';

class VendasPorProduto{
  double _quantidade;
  String _descricao;
  double _total;

  VendasPorProduto(this._quantidade, this._descricao, this._total);

  VendasPorProduto.fromJson(Map<String, dynamic> json){
    this._quantidade=OUtils.convertToDouble(json["quantidade"]);
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

  double get quantidade => _quantidade;

  set quantidade(double value) {
    _quantidade = value;
  }


}