import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'home_page.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BackgroundImage(),
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ));
    // home: new RootPage(auth: new Auth()));
  }
}*/
enum FormMode { LOGIN, SIGNUP }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController pwd_controller = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _errorMessage;
  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;
  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  static String userRole;

  // Perform login or signup
  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          widget.auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });
        if (userId != null &&
            userId.length > 0 &&
            _formMode == FormMode.LOGIN) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: new Image.asset(
            'images/background.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
        ),
        _showBody(),
        _showCircularProgress(),
      ],
    ));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
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
                // _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              SizedBox(
                height: 93.0,
                width: 50.0,
                child: Image.asset(
                  "images/logo1.png",
                  fit: BoxFit.contain,
                ),
              ),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              _showGoogleButton(),
              _showFacebook(),
              //_showSecondaryButton(),
              _showErrorMessage(),
            ],
          ),
        ));
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
    );
    /*new Hero(
      tag: 'hero',
      child: FlutterLogo(size: 100.0),
    );*/
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.account_box,
              color: Colors.black,
            )),
        controller: email_controller,
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              _isLoading = false;
            });
            return 'Email can\'t be empty';
          }
        },
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          icon: new Icon(
            Icons.lock,
            color: Colors.black,
          ),
          hintText: 'Password',
        ),
        controller: pwd_controller,
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              _isLoading = false;
            });
            return 'password can\'t be empty';
          }
        },
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: SizedBox(
        height: 55.0,
        child: new RaisedButton(
          onPressed: () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: email_controller.text, password: pwd_controller.text)
                .then((FirebaseUser user) {
              final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

              firebaseAuth.onAuthStateChanged
                  .firstWhere((user) => user != null)
                  .then((user) {
                setState(() {
                  getUserRole(user.uid);
                });
              });
            }).catchError((e) {
              print(e);
            });
          },
          elevation: 5.0,
          //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.lightBlue,

          child: new Text('LOGIN',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        ),
      ),
    );
  }

  getUserRole(String userID) {
    Firestore.instance
        .collection("users")
        .where("uid", isEqualTo: userID)
        .limit(1)
        .snapshots()
        .firstWhere((snapshot) => snapshot != null)
        .then((snapshot) {
      setState(() {
        userRole = snapshot.documents[0]['role'];
      });
    });
    //print("this is inner user ID: $userRole");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => userRole == 'user'
              ? Home() //navigate to dashboard Page
              : userRole == 'admin' ? HomePage()  : ''),
    );
  }

  Widget _showGoogleButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: SizedBox(
          height: 55.0,
          child: new SignInButton(
            Buttons.Google,
            onPressed: () {},
          )),
    );
  }

  Widget _showFacebook() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: SizedBox(
        height: 55.0,
        child: new SignInButton(
          Buttons.Facebook,
          onPressed: () {},
        ),
      ),
    );
  }
}
