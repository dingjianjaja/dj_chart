import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:dj_chart/tip_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DJDemoDetailPage extends StatelessWidget {
  final List<charts.Series> seriesList;

  DJDemoDetailPage(this.seriesList);

  factory DJDemoDetailPage.showWithSampleData() {
    return new DJDemoDetailPage(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createRandomData() {
    final random = new Random();

    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 9, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 10), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 20), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 6), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 10), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 20), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 6), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 2, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 2, 10), random.nextInt(100)),
    ];

    final data2 = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 9, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 10), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 20), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 6), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 11, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 10), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 12, 20), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 6), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 1, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 2, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2018, 2, 10), random.nextInt(100)),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
        displayName: "dingjian1",
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data2,
        displayName: "dingjian2",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      behaviors: [
        LinePointHighlighter(symbolRenderer: CustomCircleSymbolRenderer()),
      ],
      selectionModels: [
        new charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (charts.SelectionModel model) {
            SeriesDatum datum = model.selectedDatum.first;

            TimeSeriesSales sales = datum.datum;

            print(sales.time);
            print(sales.sales);

            ShowDetail(type: "type", number: 1.222, left: true);
          },
        )
      ],
      dateTimeFactory: charts.LocalDateTimeFactory(),
    );
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    // TODO: implement paint
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      fillPattern: fillPattern,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx
    );
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10, bounds.height + 10),
        fill: Color.fromHex(code: "ee228877"),
    );
//    var textStyle = style.TextStyle();
//    textStyle.color = Color.black;
//    textStyle.fontSize = 15;
//    canvas.drawText(
//        TextElement(),
//        (bounds.left).round(),
//        (bounds.top - 28).round()
//    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
