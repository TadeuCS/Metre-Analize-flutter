class TotalizadorMesa{
  double totalVenda;
  int qtdeVendas;
  int qtdePessoas;
  double ticketMedioPesssoa;
  double taxaServico;
  double couvert;

  TotalizadorMesa(this.totalVenda, this.qtdeVendas, this.qtdePessoas,
      this.ticketMedioPesssoa, this.taxaServico, this.couvert);

  TotalizadorMesa.fromJson(Map<String, dynamic> json){
    this.totalVenda=json['totalVenda'];
    this.qtdeVendas=json['qtdeVendas'];
    this.qtdePessoas=json['qtdePessoas'];
    this.ticketMedioPesssoa=json['ticketMedioPesssoa'];
    this.taxaServico=json['taxaServico'];
    this.couvert=json['couvert'];
  }

}