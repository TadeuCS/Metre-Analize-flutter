import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/pojos/UsuarioPojo.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class UsuarioModel extends Model{
  UsuarioPojo usuarioLogado;

//  static UsuarioModel of(BuildContext context) =>
//      ScopedModel.of<UsuarioModel>(context);

   //faz login e retorna a key de autenticação da API
  Future<bool> login(String usuario, String senha) async{
    var url = '${Session().apiUrl}usuario/login/?user=$usuario&pass=$senha';
    var response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode==200){
      usuarioLogado=UsuarioPojo(usuario, usuario, jsonDecode(response.body)["auth_token"], null, true);
      notifyListeners();
      return true;
    }else {
      print("Request failed with status: ${response.statusCode}.");
      return false;
    }
  }

  void logoff(){
    usuarioLogado=null;
    notifyListeners();
  }
}