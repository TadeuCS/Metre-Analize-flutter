import 'package:flutter_app/pojos/TotalizadorForma.dart';
import 'package:flutter_app/util/OUtils.dart';

class TotalizadorCaixa{
  int idCaixa;
  String _situacao;
  String operador;
  String turno;
  String dtAbertura;
  String dtFechamento;
  double _totalEntradas;
  double _totalSaidas;
  double _saldo;

  double _trocoAbertura;
  double _trocoInserido;
  double _vendasBruta;
  double _recebimentos;
  double _suprimentos;

  double _sangrias;
  double _cancelamentos;
  double _estornos;
  double _pagamentos;
  double _vales;
  double _trocoRetirado;
  List<TotalizadorForma> totalizadores=List();

  TotalizadorCaixa(this.idCaixa, this._situacao, this.operador, this.turno,
      this.dtAbertura, this.dtFechamento, this._totalEntradas,
      this._totalSaidas, this._saldo, this._trocoAbertura, this._trocoInserido,
      this._vendasBruta, this._recebimentos, this._suprimentos, this._sangrias,
      this._cancelamentos, this._estornos, this._pagamentos, this._vales,
      this._trocoRetirado, this.totalizadores);

  TotalizadorCaixa.fromJson(Map<String, dynamic> json){
    this.idCaixa=json["idCaixa"];
    this.situacao=json["situacao"];
    this.operador=json["operador"];
    this.turno=json["turno"];
    this.dtAbertura=json["dtAbertura"];
    this.dtFechamento=json["dtFechamento"];
    this._totalEntradas=OUtils.convertToDouble(json["totalEntradas"]);
    this._totalSaidas=OUtils.convertToDouble(json["totalSaidas"]);
    this._saldo=OUtils.convertToDouble(json["saldo"]);
    this._trocoAbertura=OUtils.convertToDouble(json["trocoAbertura"]);
    this._trocoInserido=OUtils.convertToDouble(json["trocoInserido"]);
    this._vendasBruta=OUtils.convertToDouble(json["vendasBruta"]);
    this._recebimentos=OUtils.convertToDouble(json["recebimentos"]);
    this._suprimentos=OUtils.convertToDouble(json["suprimentos"]);
    this._sangrias=OUtils.convertToDouble(json["sangrias"]);
    this._cancelamentos=OUtils.convertToDouble(json["cancelamentos"]);
    this._estornos=OUtils.convertToDouble(json["estornos"]);
    this._pagamentos=OUtils.convertToDouble(json["pagamentos"]);
    this._vales=OUtils.convertToDouble(json["vales"]);
    this._trocoRetirado=OUtils.convertToDouble(json["trocoRetirado"]);
    if(json["totalizadores"]!=null) {
      for (var t in json["totalizadores"]) {
        this.totalizadores.add(TotalizadorForma.fromJson(t));
      }
    }
  }

  double get trocoRetirado => OUtils.convertToDouble(_trocoRetirado);

  set trocoRetirado(double value) {
    _trocoRetirado = value;
  }

  double get vales => OUtils.convertToDouble(_vales);

  set vales(double value) {
    _vales = value;
  }

  double get pagamentos => OUtils.convertToDouble(_pagamentos);

  set pagamentos(double value) {
    _pagamentos = value;
  }

  double get estornos => OUtils.convertToDouble(_estornos);

  set estornos(double value) {
    _estornos = value;
  }

  double get cancelamentos => OUtils.convertToDouble(_cancelamentos);

  set cancelamentos(double value) {
    _cancelamentos = value;
  }

  double get sangrias => OUtils.convertToDouble(_sangrias);

  set sangrias(double value) {
    _sangrias = value;
  }

  double get suprimentos => OUtils.convertToDouble(_suprimentos);

  set suprimentos(double value) {
    _suprimentos = value;
  }

  double get recebimentos => OUtils.convertToDouble(_recebimentos);

  set recebimentos(double value) {
    _recebimentos = value;
  }

  double get vendasBruta => OUtils.convertToDouble(_vendasBruta);

  set vendasBruta(double value) {
    _vendasBruta = value;
  }

  double get trocoInserido => OUtils.convertToDouble(_trocoInserido);

  set trocoInserido(double value) {
    _trocoInserido = value;
  }

  double get trocoAbertura => OUtils.convertToDouble(_trocoAbertura);

  set trocoAbertura(double value) {
    _trocoAbertura = value;
  }

  double get saldo => OUtils.convertToDouble(_saldo);

  set saldo(double value) {
    _saldo = value;
  }

  double get totalSaidas => OUtils.convertToDouble(_totalSaidas);

  set totalSaidas(double value) {
    _totalSaidas = value;
  }

  double get totalEntradas => OUtils.convertToDouble(_totalEntradas);

  set totalEntradas(double value) {
    _totalEntradas = value;
  }

  String get situacao => _situacao==null?"":_situacao;

  set situacao(String value) {
    _situacao = value;
  }
}
