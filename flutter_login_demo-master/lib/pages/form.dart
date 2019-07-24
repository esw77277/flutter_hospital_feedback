import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(Registration());

class Registration extends StatefulWidget {
  //Reg();
  @override
  State<StatefulWidget> createState() => _RegState();

}
class _RegState extends State<Registration> {

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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.lightBlueAccent,
          ),
        ),

        home: Scaffold(
          appBar: AppBar(title: Text("Flutter"),),
          body: Column(
            children: <Widget>[
              Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.only(left:16.0,right:16.0),
                      child: TextField(
                        onChanged: (String uname){
                          getUname(uname);
                        },
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.only(left:16.0,right:16.0),
                      child: TextField(
                        onChanged: (String uemail){
                          getUemail(uemail);
                        },
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.only(left:16.0,right:16.0),
                      child: TextField(
                        onChanged: (String umobile){
                          getUmobile(umobile);
                        },
                        decoration: InputDecoration(labelText: "Mobile Number"),
                      ),
                    ),
                    SizedBox(height:10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.lightBlue,
                          onPressed: (){
                            createData();
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
    );




  }

}



