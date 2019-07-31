import 'package:flutter_app/pojos/TotalizadorBalcao.dart';
import 'package:flutter_app/pojos/TotalizadorDelivery.dart';
import 'package:flutter_app/pojos/TotalizadorMesa.dart';

class TotalizadorModulo{
  TotalizadorMesa totalizadorMesa;
  TotalizadorBalcao totalizadorBalcao;
  TotalizadorDelivery totalizadorDelivery;

  TotalizadorModulo(this.totalizadorMesa, this.totalizadorBalcao,
      this.totalizadorDelivery);

  TotalizadorModulo.fromJson(Map<String, dynamic> json){
    this.totalizadorMesa = TotalizadorMesa.fromJson(json["totalizadorMesa"]);
    this.totalizadorBalcao = TotalizadorBalcao.fromJson(json["totalizadorBalcao"]);
    this.totalizadorDelivery = TotalizadorDelivery.fromJson(json["totalizadorDelivery"]);
  }
}