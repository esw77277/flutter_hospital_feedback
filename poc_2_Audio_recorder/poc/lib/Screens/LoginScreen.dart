import 'package:poc/Constant/Constant.dart';
import '../pages/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fluttertoast/fluttertoast.dart';



class LogInScreen extends StatefulWidget {
  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
        body:
        new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new SizedBox(height: 20.0,),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: new Text("LOG IN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left),
                  )
                ],
              ),
              new SizedBox(height: 30.0,),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    "assets/images/logo.png",
                    height: 150.0,
                    width: 210.0,
                    fit: BoxFit.scaleDown,
                  )
                ],
              ),
              new Center(
                  child: new Center(
                    child: new Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: new Form(
                              autovalidate: false,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: new TextFormField(
                                      controller: email_controller,
                                      autofocus: false,

                                      decoration: new InputDecoration(
                                          labelText: "User Name*",

                                          prefixIcon: Padding(padding: EdgeInsets.only(right: 7.0),child:new Image.asset(
                                            "assets/images/user_icon.png",
                                            height: 25.0,
                                            width: 25.0,
                                            fit: BoxFit.scaleDown,
                                          )),
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0, top: 5.0),
                                      child: new TextFormField(
                                        obscureText: true,
                                        autofocus: false,
                                        controller: password_controller,
                                        decoration: new InputDecoration(

                                            labelText: "Password*",

                                            prefixIcon: Padding(padding: EdgeInsets.only(right: 7.0),child: new Image.asset(
                                              "assets/images/email_icon.png",
                                              height: 25.0,
                                              width: 25.0,
                                              fit: BoxFit.scaleDown,
                                            ))),
                                        keyboardType: TextInputType.text,
                                      )),
                                  new Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.0, top: 45.0, bottom: 20.0),
                                    child: new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(30.0)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Timeline()),
                                        );
                                      },
                                      child: new Text(
                                        "Login",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Colors.redAccent,
                                      textColor: Colors.white,
                                      elevation: 5.0,
                                      padding: EdgeInsets.only(
                                          left: 80.0,
                                          right: 80.0,
                                          top: 15.0,
                                          bottom: 15.0),
                                    ),
                                  ),
                                  new Column(
                                    children: <Widget>[
                                      new FlatButton(
                                        onPressed: () {
                                          Navigator
                                              .of(context)
                                              .pushNamed(SIGN_UP_SCREEN);
                                        },
                                        child: new Padding(
                                            padding: EdgeInsets.only(top: 20.0),
                                            child: new Text(
                                              "Don't Have An Account",
                                              style: TextStyle(
                                                  decoration:
                                                  TextDecoration.underline,
                                                  fontSize: 15.0),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          )

        ],)
       );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
