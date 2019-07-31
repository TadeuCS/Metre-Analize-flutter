import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/button_raised.dart';

class RecuperarSenhaScreen extends StatefulWidget {
  @override
  _RecuperarSenhaScreenState createState() => _RecuperarSenhaScreenState();
}

class _RecuperarSenhaScreenState extends State<RecuperarSenhaScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scarffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    _recuperarSenha() async {
      if (_formKey.currentState.validate()) {
        _scarffoldKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Color.fromRGBO(0, 174, 155, 0.8),
            duration: Duration(seconds: 2),
            content: Text('Email de Recuperação enviado com sucesso!'))
        );
         await Future.delayed(
            Duration(seconds: 2)
        );
        Navigator.pop(context);
      }
    }

    return Scaffold(
      key: _scarffoldKey,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Recupere sua Senha",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54, fontSize: 25.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image(
                height: 120.0,
                image: AssetImage("images/logo.png")
//                image: NetworkImage(
//                    "http://metre.ddns.net/MetreGestao/javax.faces.resource/logo.png.xhtml?ln=img"),
              ),
              SizedBox(
                height: 100.0,
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email de Recuperação",
//                  prefixIcon: Icon(Icons.alternate_email),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Informe um email de recuperação!";
                  }
                },
              ),
              ButtomDefault("Enviar Email", _recuperarSenha)
            ],
          ),
        ),
      ),
    );
  }
}
