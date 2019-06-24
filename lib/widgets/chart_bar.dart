/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VendasPorHorario extends StatelessWidget {

  List<charts.Series<Pollution, String>> _seriesData;

  _generateData() {
    var data1 = [
      new Pollution("18",  0),
      new Pollution("19",  150),
      new Pollution("20", 250),
      new Pollution("21", 400),
      new Pollution("22", 600),
      new Pollution("23", 380),
      new Pollution("00", 120),
    ];
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: charts.BarChart(
        _seriesData,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
//behaviors: [new charts.SeriesLegend()],
        animationDuration: Duration(seconds: 1),
      ),
    );
  }
}
class Pollution {
  String place;
  int quantity;

  Pollution(this.place, this.quantity);
}
