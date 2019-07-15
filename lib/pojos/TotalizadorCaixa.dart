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
  List<TotalizadorForma> totalizadores=List();

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
    this.totalEntradas=json["totalEntradas"]+0.00 as double;
    this.totalSaidas=json["totalSaidas"]+0.00 as double;
    this.saldo=json["saldo"]+0.00 as double;
    this.trocoAbertura=json["trocoAbertura"]+0.00 as double;
    this.trocoInserido=json["trocoInserido"]+0.00 as double;
    this.vendasBruta=json["vendasBruta"]+0.00 as double;
    this.recebimentos=json["recebimentos"]+0.00 as double;
    this.suprimentos=json["suprimentos"]+0.00 as double;
    this.sangrias=json["sangrias"]+0.00 as double;
    this.cancelamentos=json["cancelamentos"]+0.00 as double;
    this.estornos=json["estornos"]+0.00 as double;
    this.pagamentos=json["pagamentos"]+0.00 as double;
    this.vales=json["vales"]+0.00 as double;
    this.trocoRetirado=json["trocoRetirado"]+0.00 as double;
    for(var t in json["totalizadores"]) {
      this.totalizadores.add(TotalizadorForma.fromJson(t));
    }
  }
}
