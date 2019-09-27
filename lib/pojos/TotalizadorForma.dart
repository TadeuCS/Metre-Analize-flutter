import 'package:flutter_app/util/OUtils.dart';

class TotalizadorForma{

  String descricao;
  double _informado;
  double _calculado;
  double _diferenca;


  TotalizadorForma(this.descricao, this._informado, this._calculado,
      this._diferenca);

  TotalizadorForma.fromJson(Map<String, dynamic> json){
    this.descricao=json["descricao"];
    this._informado=json["informado"];
    this._calculado=json["calculado"];
    this._diferenca=json["diferenca"];
  }

  double get diferenca => OUtils.convertToDouble(_diferenca);

  set diferenca(double value) {
    _diferenca = value;
  }

  double get calculado => OUtils.convertToDouble(_calculado);

  set calculado(double value) {
    _calculado = value;
  }

  double get informado => OUtils.convertToDouble(_informado);

  set informado(double value) {
    _informado = value;
  }

}