import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Services{

  final url = "http://metre.ddns.net/MetreGestao/webresources/WS";

  void getStatus() async{
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  Future<String> login(String email, String senha) async{
    var response = await http.get('$url/?user=$email&pass=$senha');
    if(response.statusCode==200){
      return convert.jsonDecode(response.body)["auth_token"];
    }else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }
  Future<String> getChave(String cnpj) async {
    var response = await http.get('$url/Cliente/getChave/$cnpj');
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body)["chave"];
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }

}

class Retorno{
  String data;
  String chave;

  Retorno(this.data, this.chave);
}