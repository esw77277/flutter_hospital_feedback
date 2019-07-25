import 'package:flutter/material.dart';
import 'login_signup_page.dart';
import 'home_page.dart';
import 'rating.dart';
import 'userlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';

class SearchPatient extends StatefulWidget {
  @override
  _SearchPatientState createState() => new _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  TextEditingController editingController = TextEditingController();

  static List<String> pIds = new List<String>();
  static List<String> pNames = new List<String>();
  static List<String> pMobiles = new List<String>();
  static List<String> pEmails = new List<String>();

  String pID, pNAME, pEMAIL, pMOBILE;
  String btnTxt = 'Verify patient ID & Proceed';
  bool isSearchActive = false, isUserVerified = false;

  @override
  void initState() {
    super.initState();
  }

  void clearSearchResults(){
    pID = pNAME = pEMAIL = pMOBILE = 'Fetching...'; editingController.text =''; isSearchActive =isUserVerified = false;btnTxt = 'Verify patient ID & Proceed';
  }

  void filterSearchResults(String query) {
      for (int i = 0; i < pIds.length; i++) {
        if (query == pIds[i]) {
          setState(() {
            pID = pIds[i];
            pNAME = pNames[i];
            pEMAIL = pEmails[i];
            pMOBILE = pMobiles[i];
            isSearchActive = isUserVerified = true;
            btnTxt = 'Proceed to give Feedback';
          });
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Search Patient Here'),
        ),
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
        body: Column(children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance
                  .collection('In-Patient-Details')
                  .snapshots(),
              builder: (context, snapshot) {
                //SampleList[0] = snapshot.data.documents[5]['Name'];
                if (!snapshot.hasData) {
                  return Text('Loading Data... Please Wait');
                }
                int listSize = snapshot.data.documents.length;
                pEmails.length =
                    pMobiles.length = pNames.length = pIds.length = listSize;
                for (int i = 0; i < snapshot.data.documents.length; i++) {
                  pIds[i] = (snapshot.data.documents[i]['ID'] != null)
                      ? snapshot.data.documents[i]['ID']
                      : 'NA';
                  pNames[i] = (snapshot.data.documents[i]['NAME'] != null)
                      ? snapshot.data.documents[i]['NAME']
                      : 'NA';
                  pMobiles[i] = (snapshot.data.documents[i]['MOBILE'] != null)
                      ? snapshot.data.documents[i]['MOBILE']
                      : 'NA';
                  pEmails[i] = (snapshot.data.documents[i]['EMAIL'] != null)
                      ? snapshot.data.documents[i]['EMAIL']
                      : 'NA';
                }
                return Text('');
              }),
          new Container(
            color: Colors.black12,
            child: new Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    onSubmitted: (value) {
                      Text('submitted');
                    },
                    onChanged: (value) {
                      if (value.length > 5)
                        filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: new InputDecoration(
                        hintText: 'Search Patient ID here.. ',
                        border: InputBorder.none),
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        clearSearchResults();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Column(children: <Widget>[
            Card(child: ListTile(
                title: Text(pID != null ? pID : 'Loading...'))
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person,size: 30.0),
                title: Text(pNAME != null ? pNAME : 'Fetching...'),
                subtitle: Text(isSearchActive ? 'Name Verified.' : 'Name'),
                //trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.phone,size: 30.0),
                title: Text(pMOBILE != null ? pMOBILE : 'Fetching...'),
                subtitle: Text(isSearchActive ? 'Mobile Verified.' : 'Mobile'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.mail,size: 30.0),
                title: Text(pEMAIL != null ? pEMAIL : 'Fetching...'),
                subtitle: Text(isSearchActive ? 'Email Verified.' : 'Email'),
              ),
            ),
          ]),
          RaisedButton(
            child: Text(
              btnTxt.toString(),

              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              isUserVerified ?
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              )
                  :btnTxt = 'Verify patient ID & Proceed';
            },
          ),
          /*Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                  onTap: () {
                    setState(() {
                      editingController.text = items[index];
                      items.clear();
                      items.length = 0;
                    });
                  },
                );
              },
            ),
          ),*/
        ]));
  }
}
