import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class NABHdashboard extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<NABHdashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DashBoard',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: NABHdashboard(),
    );
  }
}

class _HomePageState extends State<NABHdashboard> {
  bool toggle = false;
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.deepOrange,
    Colors.indigoAccent,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("NotApplicable", () => 28);
    dataMap.putIfAbsent("High Dissatified", () => 10);
    dataMap.putIfAbsent("Dissatified", () => 8);
    dataMap.putIfAbsent("Neither satified or Dissatified", () => 6);
    dataMap.putIfAbsent("satified", () => 30);
    dataMap.putIfAbsent("Highly satified", () => 28);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NABH DashBoard"),
      ),
      body: Container(
        child: Center(
          child: toggle
              ? PieChart(
            dataMap: dataMap,
            legendFontColor: Colors.blueGrey[900],
            legendFontSize: 14.0,
            legendFontWeight: FontWeight.w500,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width / 2.7,
            showChartValuesInPercentage: true,
            showChartValues: true,
            showChartValuesOutside: true,
            chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
            colorList: colorList,
            showLegends: true,

          )

              : Text("Press FAB to show chart"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}