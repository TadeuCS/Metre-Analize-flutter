import 'dart:convert' as convert;
import 'package:flutter_app/pojos/TotalizadorAtendente.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/pojos/TotalizadorForma.dart';
import 'package:flutter_app/pojos/TotalizadorModulo.dart';
import 'package:flutter_app/pojos/TotalizadorVendaLiquida.dart';
import 'package:flutter_app/pojos/VendasPorGrupo.dart';
import 'package:flutter_app/pojos/VendasPorHorario.dart';
import 'package:flutter_app/pojos/VendasPorProduto.dart';
import 'package:flutter_app/pojos/VendasPorSubGrupo.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Services{

  final DateFormat _DATE_FORMAT = DateFormat('yyyy-MM-dd');
  final DateFormat _DATETIME_FORMAT = DateFormat('yyyy-MM-dd HH:mm');
  final _url = "http://metre.ddns.net/services/analize/";
  String _token="";
  String _path="";

  void getStatus() async{
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  //faz login e retorna a key de autenticação da API
  Future<String> getToken(String usuario, String senha) async{
    _path="usuario/login/";
    var response = await http.get('$_url$_path?user=$usuario&pass=$senha');
    if(response.statusCode==200){
      _token= convert.jsonDecode(response.body)["auth_token"];
      return _token;
    }else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os turnos de todos os caixas já abertos
  Future<List<String>> listTurnos() async {
    _path="caixa/listar/turnos/";
    var response = await http.post('$_url$_path', body: convert.jsonEncode({"auth_token": _token}));
    if (response.statusCode == 200) {
      List<String> turnos = convert.json.decode(response.body).cast<List<String>();
      return turnos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os usuários do tipo operador de caixa
  Future<List<String>> listOperadores() async {
    _path="caixa/listar/operadores/";
    var response = await http.post('$_url$_path', body: convert.jsonEncode({"auth_token": _token}));
    if (response.statusCode == 200) {
      List<String> operadores = convert.json.decode(response.body).cast<List<String>();
      return operadores;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os caixas abertos
  Future<List<TotalizadorCaixa>> listCaixasAbertos() async {
    _path="caixa/listar/abertos/";
    var response = await http.post('$_url$_path', body: convert.jsonEncode({"auth_token": _token}));
    if (response.statusCode == 200) {
      List<TotalizadorCaixa> caixas = convert.json.decode(response.body).cast<List<TotalizadorCaixa>();
      return caixas;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os caixas encerrados
  Future<List<TotalizadorCaixa>> listCaixasEncerrados({int idOperador, String turno, DateTime dtIni, DateTime dtFim}) async {
    _path="caixa/listar/encerrados/";
    dynamic parametros = {
      "auth_token": _token,
      "id_operador": idOperador,
      "turno": turno,
      "dt_ini": dtIni!=null?_DATE_FORMAT.format(dtIni):null,
      "dt_fin": dtFim!=null?_DATE_FORMAT.format(dtFim):null
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<TotalizadorCaixa> caixas = convert.json.decode(response.body).cast<List<TotalizadorCaixa>();
      return caixas;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //retorna o caixa pelo id
  Future<TotalizadorCaixa> getCaixa(int idCaixa) async {
    _path="caixa/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      TotalizadorCaixa caixa = convert.json.decode(response.body).cast<TotalizadorCaixa>();
      return caixa;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por forma
  Future<List<TotalizadorForma>> listTotalizadorFormas(int idCaixa) async {
    _path="vendas/formas/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<TotalizadorForma> formas = convert.json.decode(response.body).cast<List<TotalizadorForma>>();
      return formas;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por módulos
  Future<TotalizadorModulo> listTotalizadorModulos(int idCaixa) async {
    _path="vendas/modulos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      TotalizadorModulo modulos = convert.json.decode(response.body).cast<TotalizadorModulo>();
      return modulos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida
  Future<TotalizadorVendaLiquida> listTotalizadorVendaLiquida(int idCaixa) async {
    _path="vendas/liquida/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      TotalizadorVendaLiquida vendaLiquida = convert.json.decode(response.body).cast<TotalizadorVendaLiquida>();
      return vendaLiquida;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por atendente
  Future<List<TotalizadorAtendente>> listTotalizadorAtendente(int idCaixa) async {
    _path="vendas/atendentes/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<TotalizadorAtendente> vendasPorAtendentes = convert.json.decode(response.body).cast<List<TotalizadorAtendente>>();
      return vendasPorAtendentes;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por Produtos
  Future<List<VendasPorProduto>> listTotalizadorPorProdutos(int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/produtos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<VendasPorProduto> vendasPorProdutos = convert.json.decode(response.body).cast<List<VendasPorProduto>>();
      return vendasPorProdutos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por grupos
  Future<List<VendasPorGrupo>> listTotalizadorPorGrupos(int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/grupos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<VendasPorGrupo> vendasPorGrupos = convert.json.decode(response.body).cast<List<VendasPorGrupo>>();
      return vendasPorGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por subgrupos
  Future<List<VendasPorSubGrupo>> listTotalizadorPorSubGrupos(int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/subgrupos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<VendasPorSubGrupo> vendasPorSubGrupos = convert.json.decode(response.body).cast<List<VendasPorSubGrupo>>();
      return vendasPorSubGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores das vendas por Horario do caixa
  Future<List<VendasPorHorario>> listTotalizadorPorHorario(int idCaixa) async {
    _path="vendas/horarios/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_url$_path', body: convert.jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<VendasPorHorario> vendasPorSubGrupos = convert.json.decode(response.body).cast<List<VendasPorHorario>>();
      return vendasPorSubGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }
}