import 'package:flutter_app/pojos/TotalizadorBalcao.dart';
import 'package:flutter_app/pojos/TotalizadorDelivery.dart';
import 'package:flutter_app/pojos/TotalizadorMesa.dart';

class TotalizadorModulo{
  TotalizadorMesa totalizadorMesa;
  TotalizadorBalcao totalizadorBalcao;
  TotalizadorDelivery totalizadorDelivery;

  TotalizadorModulo(this.totalizadorMesa, this.totalizadorBalcao,
      this.totalizadorDelivery);

}