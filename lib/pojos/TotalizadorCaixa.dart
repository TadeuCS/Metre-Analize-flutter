import 'package:flutter_app/pojos/TotalizadorForma.dart';

class TotalizadorCaixa{
  int idCaixa;
  String situacao;
  String operador;
  String turno;
  String dtAbertura;
  String dtFechamento;
  double totalEntradas;
  double totalSaidas;
  double saldo;
  double trocoAbertura;
  double trocoInserido;
  double vendasBruta;
  double recebimentos;
  double suprimentos;

  double sangrias;
  double cancelamentos;
  double estornos;
  double pagamentos;
  double vales;
  double trocoRetirado;
  List<TotalizadorForma> totalizadores;

  TotalizadorCaixa(this.idCaixa, this.situacao, this.operador, this.turno,
      this.dtAbertura, this.dtFechamento, this.totalEntradas, this.totalSaidas,
      this.saldo, this.trocoAbertura, this.trocoInserido, this.vendasBruta,
      this.recebimentos, this.suprimentos, this.sangrias, this.cancelamentos,
      this.estornos, this.pagamentos, this.vales, this.trocoRetirado,
      this.totalizadores);

  TotalizadorCaixa.fromJson(Map<String, dynamic> json){
    this.idCaixa=json["idCaixa"];
    this.situacao=json["situacao"];
    this.operador=json["operador"];
    this.turno=json["turno"];
    this.dtAbertura=json["dtAbertura"];
    this.dtFechamento=json["dtFechamento"];
    this.totalEntradas=json["totalEntradas"];
    this.totalSaidas=json["totalSaidas"];
    this.saldo=json["saldo"];
    this.trocoAbertura=json["trocoAbertura"];
    this.trocoInserido=json["trocoInserido"];
    this.vendasBruta=json["vendasBruta"];
    this.recebimentos=json["recebimentos"];
    this.suprimentos=json["suprimentos"];
    this.sangrias=json["sangrias"];
    this.cancelamentos=json["cancelamentos"];
    this.estornos=json["estornos"];
    this.pagamentos=json["pagamentos"];
    this.vales=json["vales"];
    this.trocoRetirado=json["trocoRetirado"];
    this.totalizadores=json["totalizadores"];
  }
}
