import 'package:flutter/material.dart';
import 'package:Feedback/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Feedback/models/todo.dart';
import 'dart:async';
import 'package:Feedback/pages/firebase.dart';
import 'package:Feedback/pages/rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'login_signup_page.dart';
import 'thankyou.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;


  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _rating;
  bool _isRTLMode = false;
  double _index =0;
  int _count =0;
  String _uemail;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  bool _isEmailVerified = false;

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
          new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  createData(){
    DocumentReference ds = Firestore.instance.collection('User_Ratings').document(_uemail);
    Map<String,dynamic> rdata={
      "Question_ID":_count,
      "Rating": _rating,
      "User_Email":_uemail,

    };
    ds.setData(rdata).whenComplete((){print("Submitted Successful");});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Feedback'),
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
        body: Container(
          child: Center(
            child: StreamBuilder(
                stream: Firestore.instance.collection('Questions').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Text('Loading Data... Please Wait');
                  //_question = snapshot.data.documents[index]['Question']
                  return //Row(
                    //children: <Widget>[
                    Column(

                        children: <Widget> [

                          SizedBox(
                            height: 200.0,
                            width: 50.0,
                          ),
                          /*Text(
                          snapshot.data.documents[0]['Category'],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 30),
                        ),*/
                          Text(

                            snapshot.data.documents[_count]['Question'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),

                          ),
                          FlutterRatingBar(
                            initialRating: _index,
                            allowHalfRating: false,
                            ignoreGestures: false,
                            tapOnlyMode: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            onRatingUpdate: (rating) {
                              setState(() {
                                //_rating = rating;
                                rating = 0;
                                //_index=0;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                              child: RaisedButton(
                                onPressed: (){
                                  setState((){

                                    _count++;

                                    createData();
                                    if(_count==5){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Thanks()),
                                      );
                                    };


                                  });


                                },
                                child: Text("Next"),
                                color: Colors.lightBlueAccent,
                              )
                          ),
                        ]
                      /* _rating != null
                            ? Text(
                          "Rating: $_rating",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                            : Container(),*/
                      //MyAppRating(),
                      /*Text(
                          snapshot.data.documents[1]['Category'],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 30),
                        ),*/
                    );



                  //],
                  //);
                }),
          ),
        ));
  }
}

