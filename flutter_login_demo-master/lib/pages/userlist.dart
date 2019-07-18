import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_login_demo/services/authentication.dart';

void main() => runApp(userslist());

class userslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'users List',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Users List'),
          ),
          body: new StreamBuilder(
            stream: Firestore.instance.collection('Registration').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('loading wait..');

              return new ListView(
                children: snapshot.data.documents.map((document) {
                  return Card(
                    child: new ListTile(
                      contentPadding: EdgeInsets.all(6.0),
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Text('Pic',style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                      title: Text(document['Name'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(1.0),
                            )),
                      subtitle: Text(document['Email'],
                          style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic)),
                    ),
                  );

                  //return new ListTile(
                  //title: new Text(document['Name']),
                  //subtitle: new Text(document['Email']),
                  // contentPadding: EdgeInsets.all(6.0),
                  // );
                }).toList(),
                padding: EdgeInsets.all(3.0),
              );
            },
          )),
    );
  }
}
