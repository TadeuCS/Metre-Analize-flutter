import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
import 'package:flutter_app/pojos/UsuarioPojo.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/passwordRecuver_screen.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:flutter_app/widgets/button_raised.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scarffoldKey = GlobalKey();

  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Session session = Session();


  @override
  void initState() {
    super.initState();
    session.usuarioModel=UsuarioModel();
    usuarioController.text="administrador";
    senhaController.text="olivetadmin";
  }

  @override
  Widget build(BuildContext context) {

    _login() async{
      if (_formKey.currentState.validate()) {
            /*
              *tratar para na usuarioModel retornar só um boolean se está liberado o acesso.
                e assim se liberado enviar para home.
              *Limpar para não vir preenchido automaticamente com os dados do usuário administrador.
              *Ao logar preenchendo os dados de outro usuário, substituir os dados do usuario na
                memoria do celualar do usuário.
              *
             */
            UsuarioPojo usuarioLogado = await session.usuarioModel.login(usuarioController.text, senhaController.text);
            if (usuarioLogado != null) {
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              _scarffoldKey.currentState.showSnackBar(SnackBar(
                  backgroundColor: Color.fromRGBO(247, 118, 118, 1),
                  duration: Duration(seconds: 2),
                  content: Text('Usuário inválido ou acesso negado!',textAlign: TextAlign.center,)));
              Future.delayed(Duration(seconds: 2));
            }
       }
      }

    return Scaffold(
        key: _scarffoldKey,
        body: ScopedModel(
            model: session.usuarioModel,
            child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150.0,
                      ),
                      Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Image(height: 120.0, image: AssetImage("images/logo.png")
//                        image: NetworkImage(
//                            "http://metre.ddns.net/MetreGestao/javax.faces.resource/logo.png.xhtml?ln=img"),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: usuarioController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "Usuário",
                        ),
                        validator: (text) {
                          if (text.isEmpty) {
                            return "Informe o Usuário!";
                          }
                        },
                      ),
                      TextFormField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                        ),
                        validator: (text) {
                          if (text.isEmpty) {
                            return "Informe a Senha!";
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pushNamed(context, "/recovery");
                        },
                        child: Text(
                          "Esqueci a senha",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent),
                        ),
                      )
                    ],
                  ),
                  ButtomDefault("Entrar", _login)
                ],
              ),
            )
        ))
    );
  }
}
