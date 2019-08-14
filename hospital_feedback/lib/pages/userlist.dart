import 'dart:ui' as prefix0;
import 'login_signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_login_demo/services/authentication.dart';

void main() => runApp(userslist());

class userslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            //`true` if you want Flutter to automatically add Back Button when needed,
            //or `false` if you want to force your own back button every where
            title: Text('UserList'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style:
                          new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignUpPage()),
                    );
                  })
            ],
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
                        child:
                            Text('Pic', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                      title: Text(document['Name'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(1.0),
                          )),
                      subtitle: Text(document['Email'],
                          style: TextStyle(
                              fontSize: 20.0, fontStyle: FontStyle.italic)),
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
