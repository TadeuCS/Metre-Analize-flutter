import 'package:flutter/material.dart';
import 'package:flutter_app/model/UsuarioModel.dart';
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

  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  Session session = Session();

  @override
  void initState() {
    super.initState();
    session.usuarioModel = UsuarioModel();
    //    _usuarioController.text="administrador";
    //    _senhaController.text="olivetadmin";
  }

  @override
  Widget build(BuildContext context) {
    _login() async {
      if (_formKey.currentState.validate()) {
        /*
                  *tratar para na usuarioModel retornar só um boolean se está liberado o acesso.
                    e assim se liberado enviar para home.
                  *Limpar para não vir preenchido automaticamente com os dados do usuário administrador.
                  *Ao logar preenchendo os dados de outro usuário, substituir os dados do usuario na
                    memoria do celualar do usuário.
                  *
                 */
        bool autorizado = await session.usuarioModel
            .login(_usuarioController.text, _senhaController.text);
        if (autorizado) {
          await Session().prefs.setString("usuario", _usuarioController.text);
          await Session().prefs.setString("senha", _senhaController.text);
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          _scarffoldKey.currentState.showSnackBar(SnackBar(
              backgroundColor: Color.fromRGBO(247, 118, 118, 1),
              duration: Duration(seconds: 2),
              content: Text(
                'Usuário inválido ou acesso negado!',
                textAlign: TextAlign.center,
              )));
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
                          GestureDetector(
                            onLongPress: () {
                              Navigator.pushReplacementNamed(
                                  context, "/configuracao");
                            },
                            child: Image(
                                height: 120.0,
                                image: AssetImage("images/logo.png")
                                //                        image: NetworkImage(
                                //                            "http://metre.ddns.net/MetreGestao/javax.faces.resource/logo.png.xhtml?ln=img"),
                                ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            controller: _usuarioController,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: "Usuário",
                            ),
                            validator: (valor) {
                              return valor.trim().isEmpty?"Informe o Usuário!":null;
                            },
                          ),
                          TextFormField(
                            controller: _senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Senha",
                            ),
                            validator: (text) {
                              return text.trim().isEmpty?"Informe a Senha!":null;
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
                ))));
  }

  
}
