import 'package:flutter/material.dart';

class CardCaixaAberto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Caixa Aberto",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Tadeu",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                Text(
                  "Turno da Noite",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "29/03/2019 18:02",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.attach_money,size: 25.0, color: Colors.amber,),
                Text(
                  "R\$ 500,00",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                Text(
                  "R\$ 80,00",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "R\$ 420,00",
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
