import 'dart:ui' as myui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;

import '../../../function_global.dart';
import '../../../model/chartmodel.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    super.key,
    required this.title,
    required this.dataList,
    this.isTransposed = false,
  });

  final String title;
  final List<BarModel> dataList;
  final bool isTransposed;

  @override
  Widget build(BuildContext context) {
    return charts.SfCartesianChart(
      isTransposed: isTransposed,
      primaryXAxis: charts.CategoryAxis(),
      primaryYAxis: charts.NumericAxis(),
      title: charts.ChartTitle(text: title),
      tooltipBehavior: charts.TooltipBehavior(enable: true),
      series: <charts.ChartSeries<BarModel, String>>[
        charts.BarSeries<BarModel, String>(
          dataSource: dataList,
          xValueMapper: (BarModel sales, _) => getnameshort(sales.x),
          yValueMapper: (BarModel sales, _) => sales.y,
          pointColorMapper: (BarModel sales, _) {
            return myui.Color(sales.colorval.value);
          },
          dataLabelSettings: charts.DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
