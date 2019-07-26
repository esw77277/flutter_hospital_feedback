/*
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc/pages/about_page.dart';
import 'package:poc/utils/colors.dart';
import 'package:poc/utils/database_helper.dart';
import 'package:poc/utils/functions.dart';
import 'package:poc/utils/goal.dart';
import 'package:poc/utils/widgets.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/upload_voice.dart';
import '../pages/goals_page.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Timeline())));

class Timeline extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class IconColors {
  static const Color send = Color(0xffecfaf8);
  static const Color transfer = Color(0xfffdeef5);
  static const Color passbook = Color(0xfffff4eb);
  static const Color more = Color(0xffeff1fe);
}

class IconImgs {
  static const String send = "assets/play.png";
  static const String transfer = "assets/pause.png";
  static const String passbook = "assets/stop.png";
  static const String more = "assets/imgs/more.png";
  static const String freeze = "assets/imgs/freeze.png";
  static const String unlock = "assets/imgs/unlock.png";
  static const String secret = "assets/imgs/secret.png";
}

class _GoalsPageState extends State<Timeline>
    with SingleTickerProviderStateMixin {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<GoalClass> goalsList;
  int len = 0;
  bool _isPlaying = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.3,
      duration: Duration(seconds: 3),
    );
  }

  void _changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        isThemeCurrentlyDark(context) ? Brightness.light : Brightness.dark);
  } //switch between light & dark modes

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initDatabase();
    dbFuture.then((database) {
      Future<List<GoalClass>> goalsListFuture = databaseHelper.getGoalsList();
      goalsListFuture.then((goalsList) {
        setState(() {
          this.goalsList = goalsList;
          this.len = goalsList.length;
          if (this.len == 0) {
            noGoals = true; //if no goals
          } else {
            noGoals = false;
          }
        });
      });
    });
  }





  Widget buildGoalsList() {
    double _width = MediaQuery.of(context).size.width * 0.75;

    return Container(
      child: ListView.builder(
        itemCount: len,
        itemBuilder: (BuildContext context, int id) {
          return buildTile(
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Hero(
                        tag: "dartIcon${this.goalsList[id].index}",
                        child: Container(
                            width: 4.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                */
/*image: DecorationImage(
                                    image: AssetImage("assets/icon.png"))*//*

                                )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 1.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      */
/*Text("Goal #${id + 1}",
                          style: TextStyle(
                              color: MyColors.accentColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 3.0,
                      ),*//*

                      Container(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.goalsList[id].title,
                              style: TextStyle(
                                  color: invertColors(context),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              this.goalsList[id].body,
                              style: TextStyle(
                                  color: invertColors(context), fontSize: 15.0),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),

                            */
/*SizedBox(
                              height: 3.0,
                            ),*//*

                            */
/*Text(
                              this.goalsList[id].body,
                              style: TextStyle(
                                  color: invertColors(context), fontSize: 19.0),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),*//*

                            //Align(child: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"), radius: 12)),
                            Align(
                              alignment: Alignment(1, 2),
                              child: RaisedButton(
                                color: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid)),
                                child: Image.asset(
                                    _isPlaying
                                        ? "assets/play.png"
                                        : "assets/pause.png",
                                    scale: 25.0),
                                onPressed: () {
                                  if (_isPlaying)
                                    _controller.reset();
                                  else
                                    _controller.repeat();
                                  setState(() => _isPlaying = !_isPlaying);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController _myPage = PageController(initialPage: 0);
    if (goalsList == null) {
      goalsList = List<GoalClass>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:
              Icon(Icons.clear_all, color: Colors.grey), // set your color here
          onPressed: () {},
        ),
        title: Text("Drafts",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
                color: Colors.black26)),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.white
                : Colors.grey,
            child: Text(
              "A",
              style: TextStyle(fontSize: 20.0),
            ),
          ),

//          IconButton(
//            icon: isThemeCurrentlyDark(context)
//                ? Icon(EvaIcons.sun) //use sun icon
//                : Icon(EvaIcons.moon), //use moon icon
//            tooltip: isThemeCurrentlyDark(context)
//                ? "BURN YOUR EYES"
//                : "SAVE YOUR EYES",
//            onPressed: _changeBrightness,
//          ),
        ],
      ),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          CustomContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomContainer(
            child: Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.passbook,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.passbook,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),


                  ],
                ),
              ],
            ),
          ),
          noGoals == true ? buildEmptyPage(context) : buildGoalsList(),
          buildAboutPage(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeAudio()),  //timeline
          );
        },
        child: Icon(Icons.add),
        foregroundColor: MyColors.light,
        backgroundColor: MyColors.red,
        elevation: 8.0,
        heroTag: "fab",
      ),
      bottomNavigationBar:  BottomAppBar(
        elevation: 15.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                EvaIcons.grid,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Timeline()),  //timeline
                );
              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.settings,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
               */
/* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAudio()),  //
                );*//*

              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.edit,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                */
/*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAudio()),
                );*//*

              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.file,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryListTile extends StatelessWidget {
  final Color iconColor;
  final String transactionName,
      transactionType,
      //  transactionAmount,
      transactionIcon;
  final GestureTapCallback onTap;
  const HistoryListTile({
    Key key,
    this.iconColor,
    this.transactionName,
    this.transactionType,
    //  this.transactionAmount,
    this.transactionIcon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(transactionName),
        subtitle: Text(transactionType),
        trailing: CircleAvatar(
          radius: 25,
          child: Image.asset(
            transactionIcon,
            height: 25,
            width: 25,
          ),
          backgroundColor: iconColor,
        ),
//        leading: CircleAvatar(
//          radius: 25,
//          child: Image.asset(
//            transactionIcon,
//            height: 25,
//            width: 25,
//          ),
//          backgroundColor: iconColor,
//        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final GestureTapCallback onTap;
  CustomRoundedButton({
    @required this.color,
    @required this.buttonText,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            "More",
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String buttonTitle, buttonImg;
  final GestureTapCallback onTap;
  final Color circleColor;
  const CustomIconButton({
    @required this.circleColor,
    @required this.buttonTitle,
    @required this.buttonImg,
    @required this.onTap,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: circleColor,
                child: Image.asset(
                  buttonImg,
                  height: 19,
                  width: 19,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                buttonTitle,
                overflow: TextOverflow.clip,
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
*/

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc/pages/about_page.dart';
import 'package:poc/utils/colors.dart';
import 'package:poc/utils/database_helper.dart';
import 'package:poc/utils/functions.dart';
import 'package:poc/utils/goal.dart';
import 'package:poc/utils/widgets.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/timeline.dart';
import 'upload_voice.dart';
import 'goals_page.dart';

class Timeline extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class IconColors {
  static const Color send = Color(0xffecfaf8);
  static const Color transfer = Color(0xfffdeef5);
  static const Color passbook = Color(0xfffff4eb);
  static const Color more = Color(0xffeff1fe);
}

class IconImgs {
  static const String send = "assets/play.png";
  static const String transfer = "assets/pause.png";
  static const String passbook = "assets/stop.png";
  static const String more = "assets/imgs/more.png";
  static const String freeze = "assets/imgs/freeze.png";
  static const String unlock = "assets/imgs/unlock.png";
  static const String secret = "assets/imgs/secret.png";
}

class _GoalsPageState extends State<Timeline>
    with SingleTickerProviderStateMixin {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<GoalClass> goalsList;
  int len = 0;
  bool _isPlaying = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.3,
      duration: Duration(seconds: 3),
    );
  }

  void _changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        isThemeCurrentlyDark(context) ? Brightness.light : Brightness.dark);
  } //switch between light & dark modes

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initDatabase();
    dbFuture.then((database) {
      Future<List<GoalClass>> goalsListFuture = databaseHelper.getGoalsList();
      goalsListFuture.then((goalsList) {
        setState(() {
          this.goalsList = goalsList;
          this.len = goalsList.length;
          if (this.len == 0) {
            noGoals = true; //if no goals
          } else {
            noGoals = false;
          }
        });
      });
    });
  }

  Widget buildGoalsList() {
    double _width = MediaQuery.of(context).size.width * 0.75;

    return Container(
      child: ListView.builder(
        itemCount: len,
        itemBuilder: (BuildContext context, int id) {
          return buildTile(
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Hero(
                        tag: "dartIcon${this.goalsList[id].index}",
                        child: Container(
                            width: 4.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              /*image: DecorationImage(
                                    image: AssetImage("assets/icon.png"))*/
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 1.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /*Text("Goal #${id + 1}",
                          style: TextStyle(
                              color: MyColors.accentColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 3.0,
                      ),*/
                      Container(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.goalsList[id].title,
                              style: TextStyle(
                                  color: invertColors(context),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              this.goalsList[id].body,
                              style: TextStyle(
                                  color: invertColors(context), fontSize: 15.0),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),

                            /*SizedBox(
                              height: 3.0,
                            ),*/
                            /*Text(
                              this.goalsList[id].body,
                              style: TextStyle(
                                  color: invertColors(context), fontSize: 19.0),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),*/
                            //Align(child: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"), radius: 12)),
                            Align(
                              alignment: Alignment(1, 2),
                              child: RaisedButton(
                                color: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid)),
                                child: Image.asset(
                                    _isPlaying
                                        ? "assets/play.png"
                                        : "assets/pause.png",
                                    scale: 25.0),
                                onPressed: () {
                                  if (_isPlaying)
                                    _controller.reset();
                                  else
                                    _controller.repeat();
                                  setState(() => _isPlaying = !_isPlaying);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController _myPage = PageController(initialPage: 0);
    if (goalsList == null) {
      goalsList = List<GoalClass>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:
          Icon(Icons.clear_all, color: Colors.grey), // set your color here
          onPressed: () {},
        ),
        title: Text("Drafts",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
                color: Colors.black26)),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.white
                : Colors.redAccent,
            child: Text(
              "A",
              style: TextStyle(fontSize: 20.0),
            ),
          ),

//          IconButton(
//            icon: isThemeCurrentlyDark(context)
//                ? Icon(EvaIcons.sun) //use sun icon
//                : Icon(EvaIcons.moon), //use moon icon
//            tooltip: isThemeCurrentlyDark(context)
//                ? "BURN YOUR EYES"
//                : "SAVE YOUR EYES",
//            onPressed: _changeBrightness,
//          ),
        ],
      ),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          CustomContainer(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),

                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                    new Divider(
                      color: Colors.red,
                    ),

                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {
                      },
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),

                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                    new Divider(
                      color: Colors.red,
                    ),

                    HistoryListTile(
                      iconColor: IconColors.passbook,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.passbook,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomContainer(
            child: Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.send,
                      onTap: () {},
                      //  transactionAmount: "-\$210.00",
                      transactionIcon: IconImgs.send,
                      transactionName: "Audio File",
                      transactionType: "Sample text",
                    ),
                  ],
                ),
              ],
            ),
          ),
          noGoals == true ? buildEmptyPage(context) : buildGoalsList(),
          buildAboutPage(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeAudio()),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: MyColors.light,
        backgroundColor: MyColors.red,
        elevation: 8.0,
        heroTag: "fab",
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 15.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                EvaIcons.grid,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Timeline()),  //timeline
                );
              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.settings,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAudio()),  //
                );*/
              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.edit,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAudio()),
                );*/
              },
            ),
            IconButton(
              icon: Icon(
                EvaIcons.file,
                size: 30,
              ),
              color: invertColors(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryListTile extends StatelessWidget {
  final Color iconColor;
  final String transactionName,
      transactionType,
  //  transactionAmount,
      transactionIcon;
  final GestureTapCallback onTap;
  const HistoryListTile({
    Key key,
    this.iconColor,
    this.transactionName,
    this.transactionType,
    //  this.transactionAmount,
    this.transactionIcon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(transactionName),
        subtitle: Text(transactionType),
        trailing: CircleAvatar(
          radius: 25,
          child: Image.asset(
            transactionIcon,
            height: 25,
            width: 25,
          ),
          backgroundColor: iconColor,
        ),
//        leading: CircleAvatar(
//          radius: 25,
//          child: Image.asset(
//            transactionIcon,
//            height: 25,
//            width: 25,
//          ),
//          backgroundColor: iconColor,
//        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final GestureTapCallback onTap;
  CustomRoundedButton({
    @required this.color,
    @required this.buttonText,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            "More",
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String buttonTitle, buttonImg;
  final GestureTapCallback onTap;
  final Color circleColor;
  const CustomIconButton({
    @required this.circleColor,
    @required this.buttonTitle,
    @required this.buttonImg,
    @required this.onTap,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: circleColor,
                child: Image.asset(
                  buttonImg,
                  height: 19,
                  width: 19,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                buttonTitle,
                overflow: TextOverflow.clip,
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

