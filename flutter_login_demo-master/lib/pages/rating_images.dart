import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'login_signup_page.dart';

class Profile extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<Profile> {
  @override
  String msg = '';
  String color='',nocolor='';
  onclicked() {
    setState(() {
      msg;
      
      
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          backgroundColor: const Color(0xFF0099a9),
        ),
        body: Column(children: <Widget>[
          Row(
            //ROW 1
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(29.0),
                
              ),
              
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/highlidisatiifes.png'),
                    Text('Highly Satiesfied'),
                  ],
                ),
                onTap: () {
                  msg = 'Highly Satisfied';
                  onclicked();
                  print(msg);
                },
              ),

              // ),
              GestureDetector(
                //child: Image.asset('assets/disatidfied.png'),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/disatidfied.png'),
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
                    Image.asset('assets/niethersatnordis.png'),
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
          Row(//ROW 2
              children: [
            Padding(
              padding: EdgeInsets.all(29.0),
            ),
            GestureDetector(
              //child: Image.asset('assets/satisfied.png'),
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/satisfied.png'),
                    Text('Satisfied'),
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
                    Image.asset('assets/highlysatisied.png'),
                    Text('highlysatisied'),
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
                  Image.asset('assets/notapplicable.png'),
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
          Text(msg),
        ]));
  }
}