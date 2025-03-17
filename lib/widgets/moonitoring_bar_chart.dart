import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoonitoringBarChart extends StatelessWidget {
  final Function barGroupFunc;
  final Function titleFunc;
  final String medida;
  const MoonitoringBarChart(
      {super.key,
      required this.barGroupFunc,
      required this.titleFunc,
      required this.medida});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceEvenly,
        barGroups: barGroupFunc(),
        titlesData: titleFunc(),
        borderData:
            FlBorderData(show: true, border: Border.all(color: Colors.grey)),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '$medida: ${rod.toY.toStringAsFixed(0)}',
                const TextStyle(color: Color(0xFFFAFAFA)),
              );
            },
          ),
        ),
      ),
    );
  }
}
