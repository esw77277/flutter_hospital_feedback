import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_demo/models/todo.dart';
import 'dart:async';
import 'package:flutter_login_demo/pages/firebase.dart';
import 'package:flutter_login_demo/pages/rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'rating.dart';
import 'login_signup_page.dart';
import 'thankyou.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
/*
class ImageEntities{
  String imgName;
  int imgNum;
  ImageEntities(this.imgName, this.imgNum);
}*/

void main() {
  runApp(HomePage());
}

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
  String msg = '';
  var imgName = ['', '', '', '', '', ''];
  var imgNum = [1, 2, 3, 4, 5, 6];
  //List<ImageEntities> imgProp = new List<ImageEntities>();

  /*void imgPropFun(){
    for(int i=0; i<imgProp.length; i++)
      imgProp.add(new ImageEntities("",i+1));
  }*/

  bool _isRTLMode = false;
  double _index = 0;
  int _count = 0;
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

  createData() {
    DocumentReference ds =
        Firestore.instance.collection('User_Ratings').document(_uemail);
    Map<String, dynamic> rdata = {
      "QuestionID": _count,
      "Rating": msg,
      "Email": _uemail,
    };
    ds.setData(rdata).whenComplete(() {
      print("Submitted Successful");
    });
  }

  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0), // here the desired height
            child: AppBar(
              title: new Text('Feedback'),
              //backgroundColor: const Color(0xFF0099a9),
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
            )),
        /*appBar: new AppBar(
          title: new Text('Feedback'),
          //backgroundColor: const Color(0xFF0099a9),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSignUpPage()),
                  );
                })
          ],

        ),*/
        body: Container(
          child: StreamBuilder(
              stream: Firestore.instance.collection('Questions').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading Data... Please Wait');
                }
                return //Row(
                    Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        left: 100.0, top: 30, bottom: 20, right: 100.0),
                    color: Color.fromRGBO(208, 218, 226, 0.9),
                    child: new Text(
                      snapshot.data.documents[_count]['Question'],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  _count == 5
                      ? CheckboxGroup(
                          labels: <String>[
                            snapshot.data.documents[_count]['Option1'],
                            snapshot.data.documents[_count]['Option2'],
                            snapshot.data.documents[_count]['Option3'],
                            snapshot.data.documents[_count]['Option4'],
                            snapshot.data.documents[_count]['Option5'],
                          ],
                          disabled: [
                            snapshot.data.documents[_count]['Option6'],
                          ],
                          onChange: (bool isChecked, String label, int index) =>
                              print(
                                  "isChecked: $isChecked   label: $label  index: $index"),
                          onSelected: (List<String> checked) =>
                              print("checked: ${checked.toString()}"),
                        )
                      : _count == 4
                          ? new TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                            )
                          : Column(children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 20),
                              ),
                              Row(
                                //ROW 1
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(25.0),
                                  ),
                                  GestureDetector(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                            'images/' +
                                                imgNum[0].toString() +
                                                imgName[0] +
                                                '.png',
                                            height: 50),
                                        Text('Highly DiSatiesfied'),
                                      ],
                                    ),
                                    onTap: () {
                                      msg = 'Highly DiSatisfied';
                                      setState(() {
                                        msg;
                                        imgName = ['b', '', '', '', '', ''];
                                      });
                                      print(msg);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                            'images/' +
                                                imgNum[1].toString() +
                                                imgName[1] +
                                                '.png',
                                            height: 50),
                                        Text('Dis-Satiesfied'),
                                      ],
                                    ),
                                    onTap: () {
                                      msg = 'Disatisfied';
                                      setState(() {
                                        msg;
                                        imgName = ['', 'b', '', '', '', ''];
                                      });
                                      print(msg);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                            'images/' +
                                                imgNum[2].toString() +
                                                imgName[2] +
                                                '.png',
                                            height: 50),
                                        Text('Niether-Satisfied'),
                                      ],
                                    ),
                                    onTap: () {
                                      msg = 'niether Satisfied nor';
                                      setState(() {
                                        msg;
                                        imgName = ['', '', 'b', '', '', ''];
                                      });
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
                                  padding: EdgeInsets.only(left: 50.0),
                                ),
                                GestureDetector(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                          'images/' +
                                              imgNum[3].toString() +
                                              imgName[3] +
                                              '.png',
                                          height: 50),
                                      Text('Satisfied'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 109.0),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    msg = 'Satisfied';
                                    setState(() {
                                      msg;
                                      imgName = ['', '', '', 'b', '', ''];
                                    });
                                    print(msg);
                                  },
                                ),
                                GestureDetector(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                          'images/' +
                                              imgNum[4].toString() +
                                              imgName[4] +
                                              '.png',
                                          height: 50),
                                      Text('highlysatisied'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 94.0),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    msg = 'highlysatisied';
                                    setState(() {
                                      msg;
                                      imgName = ['', '', '', '', 'b', ''];
                                    });
                                    print(msg);
                                  },
                                ),
                                GestureDetector(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                          'images/' +
                                              imgNum[5].toString() +
                                              imgName[5] +
                                              '.png',
                                          height: 50),
                                      Text('NotApplicable'),
                                    ],
                                  ),
                                  onTap: () {
                                    msg = 'notapplicable';
                                    setState(() {
                                      msg;
                                      imgName = ['', '', '', '', '', 'b'];
                                    });
                                    print(msg);
                                  },
                                )
                              ]),
                            ]),

                  Padding(
                    padding: const EdgeInsets.only(top: 74.0),
                  ),
                  //Text(msg),

                  Center(
                      child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (_count == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Thanks()),
                          );
                        } else {
                          _count++;
                          _textFieldController = null;
                          createData();
                          imgName = ['', '', '', '', '', ''];
                        }
                      });
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[*/
                            Text(
                              "NEXT",
                              style: TextStyle(color: Colors.white),
                              textScaleFactor: 1.8,
                            ),
                            //Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                       // ),
                      //],
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Theme.of(context).accentColor,
                    elevation: 5.0,
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    splashColor: Colors.blueGrey,
                    //color: Colors.lightBlueAccent,
                  )),
                ]);
              }),
        ));
  }
}
