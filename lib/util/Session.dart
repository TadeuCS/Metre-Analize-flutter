import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {

  String apiUrl = "http://metre.ddns.net/services/analize/";
  final Map<String, String> requestHeaders = {
    'content-type': 'application/json'
  };
  UsuarioModel usuarioModel;
  CaixaModel caixaModel;

  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();

  factory Session(){
    return _instance;
  }

}