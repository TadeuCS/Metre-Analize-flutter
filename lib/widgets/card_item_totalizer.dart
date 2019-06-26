import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardItemTotalizer extends StatelessWidget {
  final String descricao;
  final double valor;
  final double valorCenter;
  final TextStyle decorationTitle;
  final TextStyle decorationValue;
  final Icon icone;

  final TextStyle defaultTextStyle = const TextStyle(fontSize: 15.0);
  CardItemTotalizer(
      {@required this.descricao,
      this.valor,
      this.valorCenter,
      this.decorationTitle,
      this.decorationValue,
      this.icone});

  @override
  Widget build(BuildContext context) {
    String _formataValor(double valor) {
      if (valor != null)
        return "R\$ " +
            valor.toStringAsFixed(2).replaceAll(",", "").replaceAll(".", ",");
      else
        return "R\$ 0,00";
    }

    Widget _widgetLeft() {
      return Column(
        children: <Widget>[
          Container(
            width: valorCenter!=null?100.0:null,
            alignment: Alignment.centerLeft,
            child: Text(
              descricao,
              style:
                  decorationTitle == null ? defaultTextStyle : decorationTitle,
            ),
          ),
        ],
      );
    }

    Widget _widgetCenter() {
        return Column(
          children: <Widget>[
            Container(
              width: valorCenter!=null?80.0:null,
              alignment: Alignment.centerRight,
              child: valorCenter==null?Text(""):
              Text(
                _formataValor(valorCenter),
                style: decorationValue == null
                    ? defaultTextStyle
                    : decorationValue,
              ),
            ),
          ],
        );

    }

    Widget _widgetRight() {
      return Column(
        children: <Widget>[
          Container(
            width: valorCenter!=null?80.0:null,
            alignment: Alignment.centerRight,
            child: icone != null
                ? icone
                : Text(
                    _formataValor(valor),
                    textAlign: TextAlign.right,
                    style: decorationValue == null
                        ? defaultTextStyle
                        : decorationValue,
                  ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_widgetLeft(), _widgetCenter(), _widgetRight()],
    );
  }
}
