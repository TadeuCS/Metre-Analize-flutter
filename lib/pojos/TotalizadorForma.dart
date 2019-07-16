class TotalizadorForma{

  String descricao;
  double informado;
  double calculado;
  double diferenca;

  TotalizadorForma(this.descricao, this.informado, this.calculado,
      this.diferenca);

  TotalizadorForma.fromJson(Map<String, dynamic> json){
    this.descricao=json["descricao"];
    this.informado=json["informado"]+0.00 as double;
    this.calculado=json["calculado"]+0.00 as double;
    this.diferenca=json["diferenca"]+0.00 as double;
  }
}