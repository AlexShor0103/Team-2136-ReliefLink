import 'package:flutter/material.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:relieflink/screens/ReliefHomeScreen.dart';
import '../assets/RadioIcon.dart';

import '../utils/constants.dart';

const List<Widget> states = <Widget>[
  Text('Diary'),
  Text('Mood Chart'),
];

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final List<bool> _selectedStates = <bool>[false, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 490, right: 20),
            alignment: Alignment.bottomRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  highlightElevation: 30,
                  onPressed: () {
                    showAlertDialog(height, width, context);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      'This is a space for you to journal! Get your thoughts out and help track your mood as you work towards a brighter tomorrow!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.font,
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 250),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                // ToggleButtons with a single selection.
            const SizedBox(height: 5),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  _selectedStates[index]=!_selectedStates[index];
                  if(index==0 && _selectedStates[index]){
                    TxtBold=FontWeight.bold;
                  }
                  else if(index==0 && !_selectedStates[index]){
                    TxtBold=FontWeight.normal;
                  }

                  if(index==1 && _selectedStates[index]){
                    TxtItalic=FontStyle.italic;
                  }
                  else if(index==1 && !_selectedStates[index]){
                    TxtItalic=FontStyle.normal;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderColor: AppColors.black,
              selectedBorderColor: Colors.black,
              selectedColor: AppColors.black,
              fillColor: Colors.greenAccent,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedStates,
              children: states,
            ),
            ],
          ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(height, width, BuildContext context) {
    double height1 = height;
    double width1 = width;
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        showMoodDialog(height1, width1, context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Journal"),
      content: Text(
          "Hi there! Would you like to get some of our thoughts out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height,
          width: width,
          child: alert,
        );
      },
    );
  }

  showMoodDialog(height, width, BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        showDiaryDialog(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Mood"),
      content: Text(
          "Please tell us how you are feeling."),
      actions: [
        RadioIcon(),
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height,
          width: width,
          child: alert,
        );
          },
    );
  }

  showDiaryDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // set up the buttons
    Widget continueButton = TextButton(
      child: Text("Done"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    TextEditingController diaryController = TextEditingController();
    Widget diaryEntry = TextField(
        controller: diaryController,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Diary',
        hintText: 'Write something',

    ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Journal"),
      content: Text(
          "Use the space below to write anything you want."),
      actions: [
        _buildTextField(),
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget _buildTextField() {
    final maxLines = 10;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }
}
