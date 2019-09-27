import 'package:flutter/material.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
import 'package:flutter_app/util/OneSignalUtils.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    OneSignalUtils().init();
    _validaLogin();
  }

  _validaLogin() async {
    //cria sessão se não existir uma
    if (Session() == null) {
      print('Nova Session');
      new Session();
    }
    // Instancia um usuárioModel se não existir um na sessão para receber o
    // usuário logado.
    if (Session().usuarioModel == null) {
      print('Novo UsuarioModel');
      Session().usuarioModel = UsuarioModel();
    }

    //carrega informações gravadas na memória do celular
    Session().prefs = await SharedPreferences.getInstance();
    String usuario = Session().prefs.getString("usuario");
    String senha = Session().prefs.getString("senha");
    String urlApi = Session().prefs.getString("urlApi");

    //valida se a url da API está configurada.
    if (urlApi == null) {
      print('vai pra config');
      Navigator.pushReplacementNamed(context, "/configuracao");
    } else {
      Session().apiUrl = urlApi;
      print('URL API: ${Session().apiUrl}');
      //valida usuário já logado.
      if (usuario == null || senha == null) {
        print('vai pro login');
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        bool autorizado = await Session().usuarioModel.login(usuario, senha);
        //se usuário estiver com senha inválida ou não existir, direciona
        // para o login
        if (autorizado != null && autorizado) {
          print('vai pra home');
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          print('vai pra login2');
          Navigator.pushReplacementNamed(context, "/login");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(40, 36, 36, 1),
          child: Center(child: Image.asset("images/loader.gif")),
        )
      ],
    );
  }
}
