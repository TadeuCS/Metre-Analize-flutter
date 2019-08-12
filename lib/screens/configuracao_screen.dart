import 'package:flutter/material.dart';
import 'package:flutter_app/util/Session.dart';
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
    try{
      _urlApi.text=Session().prefs.get("urlApi");
    }catch(e){
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Text(
                "Informe o URL da API ou\n leia um QRcode de configuração",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "URL servidor do Metre Analize",
                border: OutlineInputBorder(),
              ),
              controller: _urlApi,
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.center_focus_weak),
                  iconSize: 60,
                  onPressed: () {
                    scan();
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton:
      _urlApi.text.trim().isEmpty? Container():
      FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.check),
          onPressed: () {
            setState(() {
              Session().prefs.setString("urlApi", _urlApi.text);
              Navigator.pushReplacementNamed(context, "/");
            });
          }),
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
         text = text.replaceAll("/services/analize/", "");
         text = (!text.startsWith("http://") && !text.startsWith("https://")
             ? 'http://$text/services/analize/'
             : '$text/services/analize/');
         _urlApi.text = text;
       });
  }
}
