import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

class VitalSignChart extends StatefulWidget {
  final String title;

  const VitalSignChart({super.key, required this.title});

  @override
  State<VitalSignChart> createState() => _VitalSignChartState();
}

class _VitalSignChartState extends State<VitalSignChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(milliseconds: 30), updateDataSource);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                series: <ChartSeries>[
                  AreaSeries<LiveData, double>(
                    // animationDuration: 2000,
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                    color: Colors.deepOrange[300],
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfffd2e55),
                        Color(0x00fd2e55),
                      ],
                      begin: Alignment(0.5, -1.14),
                      end: Alignment(0.5, 1),
                    ),
                    borderWidth: 1,
                    borderColor: const Color(0xFFFD2E58)
                  )
                ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: NumericAxis(
                    minimum: 0.86,
                    maximum: 1.14,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Internet speed (Mbps)')))));
  }

  var time = 1.0;
  void updateDataSource(Timer timer) {
    time = time + 0.004;
    // chartData.add(LiveData(time, ( 1 + math.Random().nextDouble()*0.1 * (math.Random().nextBool() ? -1 : 1))));
    chartData.add(LiveData(time, (1 + math.Random().nextDouble()*0.1 * (math.Random().nextBool() ? -1 : 1))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      for (int i = 0; i < 250; i++) LiveData(i.toDouble(), 40)
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final double time;
  final num speed;
}