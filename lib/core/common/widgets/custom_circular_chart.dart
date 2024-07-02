import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;

import '../../../model/chartmodel.dart';

class CustomCircularChart extends StatelessWidget {
  const CustomCircularChart({
    super.key,
    required this.dataList,
  });

  final List<BarModel> dataList;

  @override
  Widget build(BuildContext context) {
    return charts.SfCircularChart(
      series: <charts.PieSeries<BarModel, String>>[
        charts.PieSeries<BarModel, String>(
          dataSource: dataList,
          xValueMapper: (BarModel data, _) => data.x,
          yValueMapper: (BarModel data, _) => data.y,
          dataLabelMapper: (BarModel data, _) => data.x,
          dataLabelSettings: charts.DataLabelSettings(
            isVisible: true,
            labelPosition: charts.ChartDataLabelPosition.outside,
          ),
          animationDuration: 500,
        ),
      ],
    );
  }
}
