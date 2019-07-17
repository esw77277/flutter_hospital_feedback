import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';
import 'login_signup_page.dart';

void main() => runApp(Reg());

class Reg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Register'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate=false;
  String uname,uemail,umobile;
  String _name,_email,_mobile;
  bool _isLoading;

  getUname(uname){
    this.uname=uname;
  }

  getUemail(uemail){
    this.uemail=uemail;
  }

  getUmobile(umobile){
    this.umobile=umobile;
  }

  createData(){
    DocumentReference ds = Firestore.instance.collection('Registration').document(uname);
    Map<String,dynamic> rdata={
      "Name":uname,
      "Email":uemail,
      "Mobile":umobile,
    };
    ds.setData(rdata).whenComplete((){print("Registration Successful");});

  }



  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Center(
            child:new Image.asset('images/background.jpg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          _showBody(),
        ],
      )
    );
  }
  Widget _showBody(){
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
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              _showNameInput(),

              _showEmailInput(),

              _showMobileInput(),
              SizedBox(
                height: 50.0,
                width: 50.0,
              ),
              _showPrimaryButton(),


            ],
          ),
        ));
  }
  Widget _showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: new TextFormField(
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            uname = val;
          },
          //decoration: InputDecoration(labelText: "Name"),
          style: style,
          decoration:new InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Name",
              icon: new Icon(
                Icons.account_box,
                color: Colors.black,
              )
          )
      ),
    );
  }
  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (String val) {
          uemail = val;
        },
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            icon: new Icon(
              Icons.email,
              color: Colors.black,
            )
        ),
      ),
    );
  }
  Widget _showMobileInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: new TextFormField(
        keyboardType: TextInputType.text,
        validator: validateMobile,
        onSaved: (String val) {
          umobile = val;
        },
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Mobile Number",
            icon: new Icon(
              Icons.mobile_screen_share,
              color: Colors.black,
            )
        ),
      ),
    );
  }
  Widget _showLogo() {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0,25.0, 0.0, 0.0),

    );
  }

  Widget _showPrimaryButton() {
    return new Material(
      elevation: 5.0,
      // borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightBlue,
      child: new MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            _validateInputs();
            // createData();
          },
          child: Text("Register",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),

      );

  }
  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    createData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
     // _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autovalidate = true;
      });
    }
  }
}