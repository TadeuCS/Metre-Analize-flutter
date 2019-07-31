import 'package:flutter_app/pojos/TotalizadorEntregador.dart';
import 'package:flutter_app/util/OUtils.dart';

class TotalizadorDelivery{

  double totalPedidos;
  int qtdeEntregas;
  double ticketMedioEntrega;
  double totalTaxaEntrega;
  List<TotalizadorEntregador> totalizadorEntregador;

  TotalizadorDelivery(this.totalPedidos, this.qtdeEntregas,
      this.ticketMedioEntrega, this.totalTaxaEntrega,
      this.totalizadorEntregador);

  TotalizadorDelivery.fromJson(Map<String, dynamic> json){
    this.totalPedidos=json['totalPedidos'];
    this.qtdeEntregas=json['qtdeEntregas'];
    this.ticketMedioEntrega=OUtils.convertToDouble(json['ticketMedioEntrega']);
    this.totalizadorEntregador=List();
    for(TotalizadorEntregador tot in json['totalizadorEntregador']){
      totalizadorEntregador.add(tot);
    }
  }
}