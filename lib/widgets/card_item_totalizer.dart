import 'package:flutter/material.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:intl/intl.dart';

class CardItemTotalizer extends StatelessWidget {
  final String descricao;
  final double valor;
  final double valorCenter;
  final dynamic tipoColumnCenter;
  final TextStyle decorationTitle;
  final TextStyle decorationValue;
  final Icon icone;

  final TextStyle defaultTextStyle = const TextStyle(fontSize: 15.0);
  CardItemTotalizer(
      {@required this.descricao,
      this.valor,
      this.valorCenter,
      this.tipoColumnCenter,
      this.decorationTitle,
      this.decorationValue,
      this.icone});

  @override
  Widget build(BuildContext context) {
    Widget _widgetLeft() {
      return Expanded(
        flex: valorCenter==null?2:1,
        child: Text(
          descricao,
          textAlign: TextAlign.left,
          style: decorationTitle == null ? defaultTextStyle : decorationTitle,
        ),
      );
    }

    Widget _widgetCenter() {
      return valorCenter == null
          ? Text("")
          : Expanded(
              child: Text(
                tipoColumnCenter == int
                    ? OUtils.OnlyInteger(valorCenter)
                    : OUtils.formataMoeda(valorCenter),
                style: decorationValue == null
                    ? defaultTextStyle
                    : decorationValue,
                textAlign: TextAlign.right,
              ),
            );
    }

    Widget _widgetRight() {
      return Expanded(
          child: Container(
        alignment: Alignment.centerRight,
        child: icone != null
            ? icone
            : Text(
                OUtils.formataMoeda(valor),
                textAlign: TextAlign.right,
                style: decorationValue == null
                    ? defaultTextStyle
                    : decorationValue,
              ),
      ));
    }

    return Row(
      children: <Widget>[_widgetLeft(), _widgetCenter(), _widgetRight()],
    );
  }
}
