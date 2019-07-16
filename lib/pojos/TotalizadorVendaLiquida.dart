import 'package:flutter_app/util/OUtils.dart';

class TotalizadorVendaLiquida{
  double _totalProdutos;
  double _totalTaxaServico;
  double _totalTaxaEntrega;
  double _totalAcrescimo;
  double _totalCouvert;
  double _totalDesconto;
  double _totalDescontoPromocional;
  double _totalDescontoPorCliente;


  TotalizadorVendaLiquida(this._totalProdutos, this._totalTaxaServico,
      this._totalTaxaEntrega, this._totalAcrescimo, this._totalCouvert,
      this._totalDesconto, this._totalDescontoPromocional,
      this._totalDescontoPorCliente);

  TotalizadorVendaLiquida.fromJson(Map<String, dynamic> json){
//    print(json);
    this._totalProdutos=json["totalProdutos"];
    this._totalTaxaServico=json["totalTaxaServico"];
    this._totalTaxaEntrega=json["totalTaxaEntrega"];
    this._totalAcrescimo=json["totalAcrescimo"];
    this._totalCouvert=json["totalCouvert"];
    this._totalDesconto=json["totalDeconto"];
    this._totalDescontoPromocional=json["totalDescontoPromocional"];
    this._totalDescontoPorCliente=json["totalDescontoPorCliente"];
  }

  double get totalDescontoPorCliente => OUtils.convertToDouble(_totalDescontoPorCliente);

  set totalDescontoPorCliente(double value) {
    _totalDescontoPorCliente = value;
  }

  double get totalDescontoPromocional => OUtils.convertToDouble(_totalDescontoPromocional);

  set totalDescontoPromocional(double value) {
    _totalDescontoPromocional = value;
  }

  double get totalDesconto => OUtils.convertToDouble(_totalDesconto);

  set totalDesconto(double value) {
    _totalDesconto = value;
  }

  double get totalCouvert => OUtils.convertToDouble(_totalCouvert);

  set totalCouvert(double value) {
    _totalCouvert = value;
  }

  double get totalAcrescimo => OUtils.convertToDouble(_totalAcrescimo);

  set totalAcrescimo(double value) {
    _totalAcrescimo = value;
  }

  double get totalTaxaEntrega => OUtils.convertToDouble(_totalTaxaEntrega);

  set totalTaxaEntrega(double value) {
    _totalTaxaEntrega = value;
  }

  double get totalTaxaServico => OUtils.convertToDouble(_totalTaxaServico);

  set totalTaxaServico(double value) {
    _totalTaxaServico = value;
  }

  double get totalProdutos => OUtils.convertToDouble(_totalProdutos);

  set totalProdutos(double value) {
    _totalProdutos = value;
  }


}