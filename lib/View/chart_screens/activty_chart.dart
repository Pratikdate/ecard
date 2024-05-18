
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ActivityChart extends StatefulWidget {
  const ActivityChart({super.key, this.isanalysis = false, required double engagementRate});
  final bool isanalysis;

  @override
  State<ActivityChart> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(1, 12),
      _ChartData(2, 15),
      _ChartData(3, 10),
      _ChartData(4, 12),
      _ChartData(5, 14),
      _ChartData(6, 18),
      _ChartData(7, 19),
      _ChartData(8, 20),
      _ChartData(9, 24),
      _ChartData(10, 20),
      _ChartData(11, 24),
      _ChartData(12, 20),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.transparent.withOpacity(0)!);
    color.add(Colors.transparent.withOpacity(0.2));
    color.add(Colors.transparent.withOpacity(0.4));
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color,
        stops: stops,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        tileMode: TileMode.mirror);

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: widget.isanalysis
          ? const NumericAxis(
              majorGridLines: MajorGridLines(
                  width: 1, color: Colors.white24, dashArray: <double>[5, 5]),
              majorTickLines:
                  MajorTickLines(width: 0), // Little sticks on left side
              axisLine: AxisLine(
                  color: Colors.transparent, // Y left line
                  dashArray: <double>[5, 5]),
              minimum: 0,
              maximum: 30,
            )
          : NumericAxis(
              isVisible: false,
            ),
      primaryYAxis: widget.isanalysis
          ? NumericAxis(
              majorGridLines: const MajorGridLines(
                  width: 1, color: Colors.white24, dashArray: <double>[5, 5]),
              majorTickLines:
                  const MajorTickLines(width: 0), // Little sticks on left side
              axisLine: const AxisLine(
                  color: Colors.transparent, // Y left line
                  dashArray: <double>[5, 5]),
              minimum: 0,
              maximum: 30,
            )
          : NumericAxis(
              isVisible: false,
            ),
      tooltipBehavior: _tooltip,
      series: <CartesianSeries<_ChartData, double?>>[
        AreaSeries(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          color: Colors.blue,
          gradient: gradientColors,
          borderGradient: LinearGradient(
              colors: [Colors.transparent.withOpacity(0),Colors.green.withOpacity(0.2),Colors.green.shade400],
              stops: stops,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.mirror),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final double x;
  final double y;
}
