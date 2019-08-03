import 'package:flutter/material.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
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
    _validaLogin();
  }

  _validaLogin() async {
    if (Session() == null) {
      Session session = Session();
    }
    if (Session().usuarioModel == null) {
      Session().usuarioModel = UsuarioModel();
    }
    /*
      * Ao logar se não tiver a url do gestão salvas na memória do aparelho,
        abrir tela para configurar lendo um QRcode gerado pelo Metre SG do cliente.
      * Fazer aqui a função de carregar os dados do ultimo login do json salvo
        no aparelho do usuário, se os dados estiverem preenchidos tentar efetuar
        o login, e redirecionar para home se login com sucesso.
    */
    Session().prefs = await SharedPreferences.getInstance();
    String usuario = await Session().prefs.getString("usuario");
    String senha = await Session().prefs.getString("senha");

    if (Session().apiUrl == null || Session().apiUrl.isEmpty) {
      print('vai pra config');
      Navigator.pushReplacementNamed(context, "/configuracao");
    } else if (usuario == null || senha == null) {
      print('vai pro login');
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      bool autorizado = await Session().usuarioModel.login(usuario, senha);
      if (autorizado) {
        print('vai pra home');
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        print('vai pra login2');
        Navigator.pushReplacementNamed(context, "/login");
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
