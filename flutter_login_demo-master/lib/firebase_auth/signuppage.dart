import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'usermanagement.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final _signUpformKey = GlobalKey<FormState>();
  String _uName;
  String _uMobile;
  String _uEmail;
  String _uAddress;
  String _uPwd;
  bool _isLoading = true;
  final uName = new TextEditingController();
  final uMobile = new TextEditingController();
  final uEmail = new TextEditingController();
  final uPwd = new TextEditingController();
  final uAddress = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpformKey,
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: uName,
                  decoration: InputDecoration(
                    hintText: "Name",
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) => _uName = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: uMobile,
                  decoration: InputDecoration(
                    hintText: "Mobile",
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        //fromARGB(1, 120, 132, 158),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mobile should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) => _uMobile = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: uEmail,
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        //fromARGB(1, 120, 132, 158),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email should not be empty & valid format';
                    }
                    return null;
                  },
                  onSaved: (value) => _uEmail = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: uPwd,
                  decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        //fromARGB(1, 120, 132, 158),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password should not be empty & maximum 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => _uPwd = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: uAddress,
                  decoration: InputDecoration(
                    hintText: "Address",
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        //fromARGB(1, 120, 132, 158),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),),

                /*TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20.0),*/
                RaisedButton(
                    child: Text('Sign Up'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      if (_signUpformKey.currentState.validate()) {
                        /*Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                        _signUpformKey.currentState.save();
                        print('valid');*/
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: uEmail.text, password: uPwd.text)
                            .then((signedInUser) {
                          UserManagement().storeNewUser(signedInUser,
                              uName.text, uMobile.text, uAddress.text, context);
                        }).catchError((e) {
                          print(e);
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
