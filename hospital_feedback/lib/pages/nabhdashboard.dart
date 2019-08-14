import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Profiles extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<Profiles> {
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
int gettotalcount(){
  int i=0;

  return i;
}
  @override
  void initState() {
    super.initState();
    int totalcount=100;
    int notapplicable = 10;
    int HighDissatified = 20;
    int Dissatified = 20;
    int Neither = 10;
    int satified = 20;
    int Highlysat = 20;
    double notapplicableper=(notapplicable/totalcount)*100;
    double HighDissatifiedper=(HighDissatified/totalcount)*100;
    double Dissatifiedper=(Dissatified/totalcount)*100;
    double Neitherper=(Neither/totalcount)*100;
    double satifiedper=(satified/totalcount)*100;
    double Highlysatper=(Highlysat/totalcount)*100;
    
    dataMap.putIfAbsent("NotApplicable", () => notapplicableper);
    dataMap.putIfAbsent("High Dissatified", () => HighDissatifiedper);
    dataMap.putIfAbsent("Dissatified", () => Dissatifiedper);
    dataMap.putIfAbsent("Neither satified or Dissatified", () => Neitherper);
    dataMap.putIfAbsent("satified", () => satifiedper);
    dataMap.putIfAbsent("Highly satified", () => Highlysatper);
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