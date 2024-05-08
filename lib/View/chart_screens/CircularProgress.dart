import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../coreRes/color_handler.dart';




class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  final List<ChartData> chartData = [

    ChartData( 65,1, ColorHandler.violate),

    ChartData(35, 1, ColorHandler.normalFont),


  ];


  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              widget: Container(
                  child: PhysicalModel(
                      child: Container(),
                      shape: BoxShape.circle,
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: const Color.fromRGBO(230, 230, 230, 1)))),

          CircularChartAnnotation(
              widget: Container(
                  child: const Text('A',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
        ],


        series: <CircularSeries<ChartData, double>>[
          DoughnutSeries<ChartData, double>(
              cornerStyle: CornerStyle.bothFlat,

              dataSource: chartData,
              xValueMapper: (ChartData data, _) =>100- data.x,
              yValueMapper: (ChartData data, _) =>data.x,
              pointColorMapper: (ChartData data, _) => data.color,
              radius: '140%'





          ),

        ]
    );
  }
}


class ChartData {
  ChartData(this.x, this.y, this.color);
  final double x;
  final double y;
  final Color color;
}