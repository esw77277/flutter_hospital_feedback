import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:Feedback/services/authentication.dart';
import 'login_signup_page.dart';

class Profile extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<Profile> {
  @override
  String msg = '';
  String icon = 'Icon(Icons.add)';

  onclicked() {
    setState(() {
      msg;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Out-patient satification'),
          backgroundColor: const Color(0xFF0099a9),
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 44.0, top: 30, bottom: 20, right: 42.2),
                color: Color.fromRGBO(208, 218, 226, 0.9),
                child: new Text(
                  'The length of time that i had to wait \n to be seen was reasonable',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
          ),
          Row(
            //ROW 1
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(23.0),
              ),

              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/highlidisatiifes.png', height: 50),
                    Text('Highly DiSatiesfied'),
                  ],
                ),
                onTap: () {
                  msg = 'Highly DiSatisfied';
                  onclicked();
                  

                  print(msg);
                },
              ),

              // ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/disatidfied.png', height: 50),
                    Text('Dis-Satiesfied'),
                  ],
                ),
                onTap: () {
                  msg = 'Disatisfied';
                  onclicked();
                  print(msg);
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/niethersatnordis.png', height: 50),
                    Text('Niether-Satisfied'),
                  ],
                ),
                onTap: () {
                  msg = 'niether Satisfied nor';
                  onclicked();
                  print(msg);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 44.0),
          ),
          Row(//ROW 2
              children: [
            Padding(
              padding: EdgeInsets.only(left: 54),
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/satisfied.png', height: 50),
                  Text('Satisfied'),
                  Padding(
                    padding: const EdgeInsets.only(left: 109.0),
                  ),
                ],
              ),
              onTap: () {
                msg = 'Satisfied';
                onclicked();
                print(msg);
              },
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/highlysatisied.png', height: 50),
                  Text('highlysatisied'),
                  Padding(
                    padding: const EdgeInsets.only(left: 94.0),
                  ),
                ],
              ),
              onTap: () {
                msg = 'highlysatisied';
                onclicked();
                print(msg);
              },
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/notapplicable.png', height: 50),
                  Text('NotApplicable'),
                ],
              ),
              onTap: () {
                msg = 'notapplicable';
                onclicked();
                print(msg);
              },
            )
          ]),
          
          Padding(
            padding: const EdgeInsets.only(top: 74.0),
          ),

          new RaisedButton(
            child: Column(
              children: <Widget>[
                Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
               
              ],
            ),

            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              print(msg);
            },
          ),
        
       
        ]));
  }
}
