import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class ActivityChart extends StatefulWidget {
  const ActivityChart({super.key});

  @override
  State<ActivityChart> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  late List<SalesData> _chartData;

  @override
  void initState() {
    _chartData= getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SfCartesianChart(series: <ChartSeries>[
            AreaSeries<SalesData,double>(
              dashArray: _chartData,
                xValueMapper: (SalesData sales,_)=>sales.year,
                yValueMapper: (SalesData sales,_)=>sales.sales
            )
          ],),
        )
    );
  }

  List<SalesData> getChartData(){
    final List<SalesData> chartData=[
      SalesData(2017, 25),
      SalesData(2018, 28),
      SalesData(2019, 21),
      SalesData(2020, 26),
      SalesData(2021, 27),

    ];
    return chartData;
  }
}


class SalesData{
  SalesData(this.year,this.sales);
  final year;
  final sales;
}