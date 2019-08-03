import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class ConfiguracaoScreen extends StatefulWidget {
  @override
  _ConfiguracaoScreenState createState() => _ConfiguracaoScreenState();
}

class _ConfiguracaoScreenState extends State<ConfiguracaoScreen> {
  final TextEditingController _urlApi = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Informe o URL da API ou\n leia um QRcode de configuração",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: _urlApi,
              enabled: false,
            ),
            IconButton(
                icon: Icon(Icons.center_focus_weak),
                onPressed: () {
                  scan();
                }),
            IconButton(icon: Icon(Icons.clear), onPressed: (){
              _urlApi.clear();
            })
          ],
        ),
      ),
    );
  }

  Future scan() async {
       await QRCodeReader()
          .setAutoFocusIntervalInMs(200) // default 5000
          .setForceAutoFocus(true) // default false
          .setTorchEnabled(true) // default false
          .setHandlePermissions(true) // default true
          .setExecuteAfterPermissionGranted(true) // default true
          .scan()
          .then((text){
         _urlApi.text=text;
       });
  }
}
