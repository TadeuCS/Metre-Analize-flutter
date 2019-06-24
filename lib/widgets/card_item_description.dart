import 'package:flutter/material.dart';

class CardItemDescription extends StatelessWidget {

  final String textLeft;
  final String textRight;
  TextStyle decoration = const TextStyle(fontSize: 15.0);


  CardItemDescription({@required this.textLeft,@required this.textRight, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          textLeft,
          textAlign: TextAlign.start,
          style: decoration,
        ),
        Text(
          textRight,
          textAlign: TextAlign.end,
          style: decoration,
        ),
      ],
    );;
  }
}
