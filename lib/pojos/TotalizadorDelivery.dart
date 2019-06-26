import 'package:flutter_app/pojos/TotalizadorEntregador.dart';

class TotalizadorDelivery{

  double totalPedidos;
  int qtdeEntregas;
  double ticketMedioEntrega;
  double totalTaxaEntrega;
  List<TotalizadorEntregador> totalizadorEntregador;

  TotalizadorDelivery(this.totalPedidos, this.qtdeEntregas,
      this.ticketMedioEntrega, this.totalTaxaEntrega,
      this.totalizadorEntregador);


}