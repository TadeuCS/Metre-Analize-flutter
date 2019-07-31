class TotalizadorBalcao{
  int qtdePedidos;
  double totalVendido;

  TotalizadorBalcao(this.qtdePedidos, this.totalVendido);


  TotalizadorBalcao.fromJson(Map<String, dynamic> json){
    this.qtdePedidos=json['qtdePedidos'];
    this.totalVendido=json['totalVendido'];
  }
}