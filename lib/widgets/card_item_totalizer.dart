import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardItemTotalizer extends StatelessWidget {
  final String descricao;
  final double valor;
  final TextStyle decorationTitle;
  final TextStyle decorationValue;
  final IconData icone;

  final TextStyle defaultTextStyle = const TextStyle(fontSize: 15.0);

  CardItemTotalizer(
      {@required this.descricao,
      this.valor,
      this.decorationTitle,
      this.decorationValue,
      this.icone});

  @override
  Widget build(BuildContext context) {

    String _formataValor(){
      if(valor!=null)
        return "R\$ "+valor.toStringAsFixed(2).replaceAll(",", "").replaceAll(".", ",");
      else
        return "R\$ 0,00";
    }

    Widget _widgetContruct() {
      if (icone != null)
        return Icon(icone);
      else
        return Text(
          _formataValor(),
          textAlign: TextAlign.end,
          style: decorationValue==null?defaultTextStyle:decorationValue,
        );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          descricao,
          textAlign: TextAlign.start,
          style: decorationTitle==null?defaultTextStyle:decorationTitle,
        ),
        _widgetContruct(),
      ],
    );
  }
}
