import 'package:flutter/material.dart';
import 'package:flutter_app/util/Session.dart';

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
    /*
      * Ao logar se não tiver a url do gestão salvas na memória do aparelho,
        abrir tela para configurar lendo um QRcode gerado pelo Metre SG do cliente.
      * Fazer aqui a função de carregar os dados do ultimo login do json salvo
        no aparelho do usuário, se os dados estiverem preenchidos tentar efetuar
        o login, e redirecionar para home se login com sucesso.
    */
    await Future.delayed(Duration(seconds: 2));
    if (Session() == null || Session().usuarioModel == null) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      Navigator.pushReplacementNamed(context, "/home");
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
