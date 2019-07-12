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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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


  String uname,uemail,umobile;

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final name = TextField(
      onChanged: (String uname){
        getUname(uname);
      },
      //decoration: InputDecoration(labelText: "Name"),
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField   =  TextField(
      onChanged: (String uemail){
        getUemail(uemail);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final PhoneNumber = TextField(
      onChanged: (String umobile){
        getUmobile(umobile);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phonenumber",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final Password = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          createData();
          Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => HomePage()),
           );
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final RePassword = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Re enter password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      child: Image.asset(
                        "images/logo.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 10.0),
                    name,
                    SizedBox(height: 10.0),
                    emailField,
                    SizedBox(
                      height: 10.0,
                    ),
                    PhoneNumber,
                    SizedBox(
                      height: 10.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 100.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}