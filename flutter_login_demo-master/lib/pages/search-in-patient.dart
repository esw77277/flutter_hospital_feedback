import 'package:flutter/material.dart';
import 'login_signup_page.dart';
import 'rating.dart';
import 'userlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPatient extends StatefulWidget {
  @override
  _SearchPatientState createState() => new _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  TextEditingController editingController = TextEditingController();
  List<String> duplicateItems = new List<String>();
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                    MaterialPageRoute(builder: (context) => Reg()),
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
              new ListTile(
                title: new Text("Search Patient"),
                trailing: new Icon(Icons.dashboard),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPatient()),
                  );
                },
              ),
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
              //stream: bloc.getReult,
              stream: Firestore.instance
                  .collection('In-Patient-Details')
                  .snapshots(),
              builder: (context, snapshot) {
                //SampleList[0] = snapshot.data.documents[5]['Name'];
                if (!snapshot.hasData) {
                  return Text('Loading Data... Please Wait');
                }
                duplicateItems =
                    new List<String>(snapshot.data.documents.length);
                for (int i = 0; i < snapshot.data.documents.length; i++) {
                  duplicateItems[i] = (snapshot.data.documents[i]['ID'] != null)
                      ? snapshot.data.documents[i]['ID']
                      : 'NA';
                }
                return Text('');
              }),
          new Container(
            color: Colors.black12,
            child: new Padding(
              padding: const EdgeInsets.all(3.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    onSubmitted: (vlaue) {
                      Text('submitted');
                    },
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: new InputDecoration(
                        hintText: 'Search In-Patient ID',
                        border: InputBorder.none),
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                ),


              ),


            ),

          ),
          SizedBox(
            height: 20.0,
            width: 20.0,
          ),
          FormUI(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            ),
          ),
        ]));
  }

// Here is our Form UI
  Widget FormUI() {
    return new Column(

      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(

            icon: const Icon(Icons.person),
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          elevation: 4.0,
          color: Theme.of(context).accentColor,
          onPressed: _validateInputs,
          child: new Text('Validate',style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }

  void _validateInputs() {}
}
