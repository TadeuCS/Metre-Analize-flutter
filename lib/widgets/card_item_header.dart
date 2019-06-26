import 'package:flutter/material.dart';

class CardItemHeader extends StatelessWidget {
  final String tituloRight;
  final String tituloCenter;
  final String tituloLeft;
  final TextStyle decoration;

  final TextStyle defaultTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600);

  CardItemHeader(
      {@required this.tituloLeft,
      this.tituloCenter,
      @required this.tituloRight,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Text(
                tituloLeft,
                style: decoration == null ? defaultTextStyle : decoration,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              child:
              tituloCenter==null? Text(""):
              Text(
                tituloCenter,
                style: decoration == null ? defaultTextStyle : decoration,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              child: Text(
                tituloRight,
                style: decoration == null ? defaultTextStyle : decoration,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
