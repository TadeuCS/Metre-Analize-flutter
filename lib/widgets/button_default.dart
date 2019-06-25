import 'package:flutter/material.dart';

class ButtomDefault extends StatelessWidget {

  final String _descricao;
  final VoidCallback _acao;


  ButtomDefault(this._descricao,this._acao);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          color: Colors.deepOrangeAccent,
          textColor: Colors.white,
          child: Text(
            _descricao,
          ),
          onPressed: _acao),
    );
  }
}
