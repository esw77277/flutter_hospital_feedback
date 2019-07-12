import 'package:flutter/material.dart';

void main() => runApp(Thanks());

class Thanks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    MyAppState myAppState() => new MyAppState();
    return myAppState();
  }
}

class MyAppState extends State<Thanks> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Builder(
      builder: (BuildContext context) {
        return new Stack(
          children: <Widget>[
            new Image.asset(
              'asserts/404.jpg',
              fit: BoxFit.fitWidth,
            ),
            new Center(
              child: new Container(
                height: 370.0,
                child: Container(
                  height: 250.0,
                  child: new Card(
                    color: Colors.white,
                    elevation: 6.0,
                    margin: EdgeInsets.only(right: 15.0, left: 15.0),
                    child: new Wrap(
                      children: <Widget>[
                        Center(
                          child: new Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,

                              )),
                        ),
                        Center(
                          child: new Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: new Text(
                              'Success',
                              style: TextStyle(
                                  fontSize: 55.0, color: Colors.green),
                            ),
                          ),
                        ),
                        Center(
                          child: new Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: new Text(
                              'you are all done',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 120.0)),
                      ],
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 30),
              ),
            ),
            new Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 310.0)),
                Text('Thank you',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                        fontSize: 35.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
              ],
            ))
          ],
        );
      },
    )));
  }
}
