import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final String _descricao;
  final VoidCallback _acao;


  ButtonCircle(this._descricao, this._acao);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        child: Text(_descricao),
        textColor: Colors.white,
        shape: CircleBorder(),
        onPressed: _acao,

      ),
    );
  }
}
