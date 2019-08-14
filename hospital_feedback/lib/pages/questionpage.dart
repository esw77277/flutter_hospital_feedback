import "package:flutter/material.dart";
//import 'package:flutter_widgets/const/_const.dart';

class PlaceHolderPage extends StatefulWidget {
  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //our code here.
            SizedBox(height: 600)
          ],
        ),
      ),
    );
  }
}