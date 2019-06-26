import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    void _login(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }

    return new Scaffold(
        body: SingleChildScrollView(
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
                      Image(
                        height: 120.0,
                        image: NetworkImage(
                            "http://metre.ddns.net/MetreGestao/javax.faces.resource/logo.png.xhtml?ln=img"),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: usuarioController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                        ),
                        validator: (text) {
                          if (text.isEmpty) {
                            return "Informe o Email!";
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
                        onPressed: () {},
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
                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: _login,
                      color: Colors.deepOrange,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
