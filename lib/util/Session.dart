import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {

  UsuarioModel usuarioModel;
  CaixaModel caixaModel;
  String apiUrl;
  SharedPreferences prefs;
  final Map<String, String> requestHeaders = {
    'content-type': 'application/json'
  };

  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();

  factory Session(){
    return _instance;
  }

}