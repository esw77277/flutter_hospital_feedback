import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'login_signup_page.dart';

class Profile extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginSignUpPage()),
            );
          })
        ],
      ),
    );
  }
}