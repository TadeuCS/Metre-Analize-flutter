import 'package:flutter/material.dart';

class ButtomDefault extends StatelessWidget {

  final String _descricao;
  final VoidCallback _acao;


  ButtomDefault(this._descricao,this._acao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 40.0,
        width: double.infinity,
        child: RaisedButton(
            textColor: Colors.white,
            child: Text(
              _descricao,
            ),
            onPressed: _acao),
      ),
    );
  }
}
