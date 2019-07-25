import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/model/UsuarioModel.dart';

class Session {

  UsuarioModel usuarioModel;
  CaixaModel caixaModel;

  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();

  factory Session(){
    return _instance;
  }

}