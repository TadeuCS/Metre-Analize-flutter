import 'package:flutter_app/pojos/UsuarioPojo.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UsuarioModel extends Model{
  UsuarioPojo usuarioLogado;

//  static UsuarioModel of(BuildContext context) =>
//      ScopedModel.of<UsuarioModel>(context);

   //faz login e retorna a key de autenticação da API
  Future<UsuarioPojo> login(String usuario, String senha) async{
    var response = await http.get('${Session().apiUrl}usuario/login/?user=${usuario}&pass=${senha}');
    print(response.statusCode);
    if(response.statusCode==200){
      usuarioLogado=UsuarioPojo(usuario, usuario, jsonDecode(response.body)["auth_token"], null, true);
      notifyListeners();
      return usuarioLogado;
    }else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

  void logoff(){
    usuarioLogado=null;
    notifyListeners();
  }
}