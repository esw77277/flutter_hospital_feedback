import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyData());

class MyData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyData();
  }
}

class _MyData extends State<MyData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Data Fetching",
      home: Scaffold(
        appBar: AppBar(
          //title: Text("Data"),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('Questions').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Loading Data... Please Wait');
              return Column(
                children: <Widget>[
                  Text(
                    snapshot.data.documents[0]['Category'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(snapshot.data.documents[0]['Question'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(snapshot.data.documents[1]['Category'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(snapshot.data.documents[1]['Question'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
