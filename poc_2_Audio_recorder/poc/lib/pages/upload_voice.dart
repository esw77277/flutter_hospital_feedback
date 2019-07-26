import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:poc/utils/colors.dart';
import 'package:poc/utils/functions.dart';
import '../pages/timeline.dart';
import '../pages/goals_page.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: HomeAudio())));
}

class HomeAudio extends StatefulWidget {
  final String title = "Upload Voice";
  HomeAudio() : super();
  @override
  HomeAudioState createState() {
    return HomeAudioState();
  }
}

class HomeAudioState extends State<HomeAudio> {
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text('Record Content'),
      content: Step1(),
      isActive: true,
    ),
    Step(
      title: Text('Enter Content'),
      content: Step2(),
      isActive: true,
    ),
    Step(
      title: Text('Traslate Content'),
      content: Step3(),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
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
      // Body
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.vertical,
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  current_step == 2 // this is the last step
                      ? RaisedButton.icon(
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: onStepContinue,
                          icon: Icon(Icons.create),
                          label: Text('SUBMIT'),
                        )
                      : RaisedButton.icon(
                          icon: Icon(Icons.navigate_next),
                          onPressed: onStepContinue,
                          label: Text('CONTINUE'),
                          color: Colors.redAccent,
                          textColor: Colors.white,
                        ),
                  FlatButton.icon(
                    icon: Icon(Icons.delete_forever),
                    label: const Text('CANCEL'),
                    onPressed: onStepCancel,
                    textColor: Colors.black,
                    color: Colors.white,
                  )
                ],
              ),
            );
          },
//            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//              return Row(
//                mainAxisSize: MainAxisSize.max,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//
//              RaisedButton(
//                    onPressed: onStepCancel,
//                    child: const Text('Back!'),
//                   textColor: Colors.black,
//                   color: Colors.white,
//                  ),
//                  RaisedButton(
//                    onPressed: onStepContinue,
//                    child: const Text('Next!'),
//                    textColor: Colors.white,
//                    color: Colors.redAccent ,
//                  ),
//                ],
//              );
//            },
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigateToCreateGoal(GoalClass("", ""));
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
                  MaterialPageRoute(
                      builder: (context) => Timeline()), //timeline
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

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: new Column(children: [
        new TextFormField(
          decoration: new InputDecoration(
            labelText: "Drop Down Value",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 10.0,
        ),
        new TextFormField(
          decoration: new InputDecoration(
            labelText: "Text Box 1",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 10.0,
        ),
        new TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: 'Tell us about yourself',
              helperText: 'this is just a demo.',
              labelText: 'story',
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.green,
              ),
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)),
        ),
      ]),
    );
  }
}

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: new Column(children: [
        new TextFormField(
          decoration: new InputDecoration(
            labelText: "Text Box3",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 10.0,
        ),
        new TextFormField(
          decoration: new InputDecoration(
            labelText: "Text Box 4",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 10.0,
        ),
        new TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: 'Tell us about yourself',
              helperText: 'this is just a demo.',
              labelText: 'story',
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.green,
              ),
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)),
        ),
      ]),
    );
  }
}

class Step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: new Column(children: [
        new TextFormField(
          decoration: new InputDecoration(
            labelText: "Text Box3",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 10.0,
        ),
        new TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: 'Tell us about yourself',
              helperText: 'this is just a demo.',
              labelText: 'Comment',
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.green,
              ),
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)),
        ),
      ]),
    );
  }
}
