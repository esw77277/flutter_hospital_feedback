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
        home: new Scaffold(
            body: new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  image: new AssetImage('images/thankubg.jpg'),
                  fit: BoxFit.cover,
                )),
                child: new Builder(
                  builder: (BuildContext context) {
                    return new Stack(
                      children: <Widget>[
                        new Container(
                          height: 480.0,
                          child: Container(
                            height: 250.0,
                            child: new Card(
                              color: Colors.white,
                              elevation: 10.0,
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: new Wrap(
                                children: <Widget>[
                                  Center(
                                    child: new Container(
                                      padding: EdgeInsets.only(top: 29),
                                      child: Image.asset(
                                        'images/successful.PNG',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: new Container(
                                      margin: EdgeInsets.only(top: 20.0),
                                      child: new Text(
                                        'success',
                                        style: TextStyle(
                                            fontSize: 45.0,
                                            color: Color(0xff0374b1)),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: new Container(
                                      margin: EdgeInsets.only(top: 30.0),
                                      child: new Text(
                                        'You are all done',
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            color: Color(0xff747474)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 120.0)),
                                ],
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 30, top: 105),
                        ),
                        new Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 210.0)),
                            Container(
                              height: 50.0,
                              width: 205,
                              child: Center(
                                child: Text('Thank you',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 36.0,
                                    )),
                              ),
                              color: Color(0xff0374b1),
                            )
                          ],
                        ))
                      ],
                    );
                  },
                ))));
  }
}
