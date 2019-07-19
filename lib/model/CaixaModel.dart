import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/pojos/Operador.dart';
import 'package:flutter_app/pojos/TotalizadorAtendente.dart';
import 'package:flutter_app/pojos/TotalizadorCaixa.dart';
import 'package:flutter_app/pojos/TotalizadorForma.dart';
import 'package:flutter_app/pojos/TotalizadorModulo.dart';
import 'package:flutter_app/pojos/TotalizadorVendaLiquida.dart';
import 'package:flutter_app/pojos/VendasPorGrupo.dart';
import 'package:flutter_app/pojos/VendasPorHorario.dart';
import 'package:flutter_app/pojos/VendasPorProduto.dart';
import 'package:flutter_app/pojos/VendasPorSubGrupo.dart';
import 'package:flutter_app/util/OUtils.dart';

class CaixaModel extends Model {
  //filtros
  int idOperador;
  String turno;
  DateTime dtIni;
  DateTime dtFin;

  //variáveis das consultas
  String _path;
  String _token;

  //variáveis temporárias
  List<TotalizadorCaixa> caixasFiltrados=List();
  TotalizadorCaixa caixaSelecionado;

  final String _urlApi="http://metre.ddns.net/services/analize/";
  final Map<String, String> requestHeaders = {
    'content-type': 'application/json'
  };

  static CaixaModel of(BuildContext context) =>
      ScopedModel.of<CaixaModel>(context);
  
  CaixaModel(this._token);

  //Filtrar os caixas encerrados
  void filtrarCaixasEncerrados(){
    print("Operador: ${idOperador}");
    print("Turno: ${turno}");
    print("Dt Ini: ${dtIni}");
    print("Dt Fin: ${dtFin}");
    notifyListeners();
  }

  //lista os turnos de todos os caixas já abertos
  Future<List<String>> listTurnos() async {
    _path="caixa/listar/turnos/";
    var response = await http.post('$_urlApi$_path', body: jsonEncode({"auth_token": _token}), headers: requestHeaders);
    if(response.statusCode==200){
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<String> lista = List<String>();
      for(var c in jsonData){
        lista.add(c);
      }
      return lista;
    }
    return null;
  }

  //lista os usuários do tipo operador de caixa
  Future<List<Operador>> listOperadores() async {
    _path="caixa/listar/operadores/";
    var response = await http.post('$_urlApi$_path', body: jsonEncode({"auth_token": _token}), headers: requestHeaders);
    if(response.statusCode==200){
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<Operador> lista = List();
      for(var c in jsonData){
        lista.add(Operador.fromJson(c));
      }
      return lista;
    }

    return null;
  }

  //lista os caixas abertos
  Future<List<TotalizadorCaixa>> listCaixasAbertos() async {
    _path="caixa/listar/abertos/";
    var response = await http.post('$_urlApi$_path', body: json.encode({"auth_token":_token}), headers: requestHeaders);

    if(response.statusCode==200){
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<TotalizadorCaixa> lista = List<TotalizadorCaixa>();
      try{
        for(var c in jsonData){
          lista.add(TotalizadorCaixa.fromJson(c));
        }
      }catch(e){
        print(e);
      }
      return lista;
    }

    return null;
  }

  //lista os caixas encerrados
  Future<List<TotalizadorCaixa>> listCaixasEncerrados() async {
    _path="caixa/listar/encerrados/";
    Map parametros = {
      "auth_token": _token,
//      "turno": turno,
//      "id_operador": idOperador,
      "dt_ini": dtIni!=null?OUtils.formataDataSQL(dtIni):OUtils.formataDataSQL(DateTime(2019,04,11)),
      "dt_fin": dtFin!=null?OUtils.formataDataSQL(dtFin):OUtils.formataDataSQL(DateTime(2019,04,11))
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if(response.statusCode==200){
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<TotalizadorCaixa> lista = List<TotalizadorCaixa>();
      for(var c in jsonData){
        try{
          lista.add(TotalizadorCaixa.fromJson(c));
        }catch(e){
          print(e);
        }
      }
      return lista;
    }
    return null;
  }

  //retorna o caixa pelo id
  Future<TotalizadorCaixa> getCaixa( int idCaixa) async {
    _path="caixa/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      TotalizadorCaixa caixa = json.decode(response.body).cast<TotalizadorCaixa>();
      return caixa;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por forma
  Future<List<TotalizadorForma>> listTotalizadorFormas( int idCaixa) async {
    _path="vendas/formas/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<TotalizadorForma> lista = List<TotalizadorForma>();
      for(var c in jsonData){
        try{
          lista.add(TotalizadorForma.fromJson(c));
        }catch(e){
          print(e);
        }
      }
      return lista;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por módulos
  Future<TotalizadorModulo> listTotalizadorModulos( int idCaixa) async {
    _path="vendas/modulos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      TotalizadorModulo modulos = json.decode(response.body).cast<TotalizadorModulo>();
      return modulos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida
  Future<TotalizadorVendaLiquida> listTotalizadorVendaLiquida( int idCaixa) async {
    _path="vendas/liquida/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      return TotalizadorVendaLiquida.fromJson(jsonData);
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda bruta por atendente
  Future<List<TotalizadorAtendente>> listTotalizadorAtendente( int idCaixa) async {
    _path="vendas/atendentes/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      List<TotalizadorAtendente> vendasPorAtendentes = json.decode(response.body).cast<List<TotalizadorAtendente>>();
      return vendasPorAtendentes;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por Produtos
  Future<List<VendasPorProduto>> listTotalizadorPorProdutos( int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/produtos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      List<VendasPorProduto> vendasPorProdutos = json.decode(response.body).cast<List<VendasPorProduto>>();
      return vendasPorProdutos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por grupos
  Future<List<VendasPorGrupo>> listTotalizadorPorGrupos( int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/grupos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      List<VendasPorGrupo> vendasPorGrupos = json.decode(response.body).cast<List<VendasPorGrupo>>();
      return vendasPorGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores da venda liquida por subgrupos
  Future<List<VendasPorSubGrupo>> listTotalizadorPorSubGrupos( int idCaixa, int pos_ini, int qtde_limit) async {
    _path="vendas/subgrupos/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
      "pos_ini" : pos_ini,
      "qtde_limit": qtde_limit
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      List<VendasPorSubGrupo> vendasPorSubGrupos = json.decode(response.body).cast<List<VendasPorSubGrupo>>();
      return vendasPorSubGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  //lista os totalizadores das vendas por Horario do caixa
  Future<List<VendasPorHorario>> listTotalizadorPorHorario( int idCaixa) async {
    _path="vendas/horarios/";
    dynamic parametros = {
      "auth_token": _token,
      "id_caixa": idCaixa,
    };
    var response = await http.post('$_urlApi$_path', body: jsonEncode(parametros), headers: requestHeaders);
    if (response.statusCode == 200) {
      List<VendasPorHorario> vendasPorSubGrupos = json.decode(response.body).cast<List<VendasPorHorario>>();
      return vendasPorSubGrupos;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

}