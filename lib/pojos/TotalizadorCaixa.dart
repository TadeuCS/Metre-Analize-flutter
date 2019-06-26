import 'package:flutter_app/pojos/TotalizadorForma.dart';

class TotalizadorCaixa{
  int idCaixa;
  String situacao;
  String operador;
  String turno;
  DateTime dtAbertura;
  DateTime dtFechamento;
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

}
