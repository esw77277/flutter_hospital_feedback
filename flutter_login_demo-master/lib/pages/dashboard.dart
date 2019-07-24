import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'login_signup_page.dart';
import 'profile.dart';
import 'rating.dart';
import 'search-in-patient.dart';
import 'userlist.dart';


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Home(),

    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Home(),
      '/profile': (BuildContext context) => new Profile(),
      //'/feedback': (BuildContext context) => new Feedback(),
    },
    //about: new AboutPage(),
  ));
}

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.onSignedOut}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<Home> {
  String _value = '';

  void _onClick(String value) => setState(() => _value = value);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0), // here the desired height
          child: AppBar(
            title: new Text('Home'),
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
      /*appBar: new

      AppBar(
        title: new Text('DashBoard'),
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
      ),*/
      drawer: new Drawer(
        child: new ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Flutter Dev"),
              accountEmail: Text("Flutter.Dev@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            //   new Divider(
            //     color: Colors.green,
            //     ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            new ListTile(
              title: new Text("Search Patient"),
              trailing: new Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reg()),
                );
              },
            ),
            new ListTile(
              title: new Text("In-Patient Feedback"),
              trailing: new Icon(Icons.hotel),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPatient()),
                );
              },
            ),

            new ListTile(
              title: new Text("Out-Patient Feedback"),
              trailing: new Icon(Icons.airline_seat_recline_normal),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reg()),
                );
              },
            ),
            /*new ListTile(
              title: new Text("NABH Dashboard"),
              trailing: new Icon(Icons.dashboard),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NABHdashboard()),
                );
              },
            ),*/
            new ListTile(
              title: new Text("User List"),
              trailing: new Icon(Icons.person_pin_circle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userslist()),
                );
              },
            ),


            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.power_settings_new),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Doctors", Icons.person),
            makeDashboardItem("Hospitals", Icons.business),
            makeDashboardItem("Medicals", Icons.local_pharmacy),
            makeDashboardItem("Labs", Icons.local_hospital),
            makeDashboardItem("Gift Cards", Icons.card_giftcard),
            makeDashboardItem("More", Icons.move_to_inbox),


          ],

        ),
      ),
    );
  }
}

Card makeDashboardItem(String title, IconData icon) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}
