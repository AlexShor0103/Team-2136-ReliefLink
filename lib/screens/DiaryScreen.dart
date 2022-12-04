import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:relieflink/screens/ReliefHomeScreen.dart';

import '../components/Profile/ProfileScreen.dart';
import '../recommendations/RecommendationScreen.dart';
import '../utils/constants.dart';
import 'package:pie_chart/pie_chart.dart' as piechart;
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'MapScreen.dart';
import 'OnboardingScreen.dart';


TextEditingController diaryController = TextEditingController();

const List<Widget> states = <Widget>[
  Text('Diary'),
  Text('Mood Chart'),
];

Map<String, double> dataMap = {
  "Happy": 12,
  "Neutral": 13,
  "Sad": 9
};

final colorList = <Color>[
  Colors.green,
  Colors.red,
  Colors.blue
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
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
                  SizedBox(
                    height:20
                  ),
                  const Text(
                    'Previous Journal Entries',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.font,
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  meScreenButton(context, "Profile"),
                  const SizedBox(
                    height: 20,
                  ),
                  meScreenButton(context, "Recommendations"),
                  const SizedBox(
                    height: 20,
                  ),
                  meScreenButton(context, "Find a Health Care Center"),
                  const SizedBox(
                    height: 20,
                  ),
                  meScreenButton(context, "Onboarding")
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              FloatingActionButton(
              backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                highlightElevation: 30,
                onPressed: () {
                showGraphDialog(height, width, context);
                },
                child: Icon(Icons.pie_chart),
              ),
              ],
            ),
          ),
          ),
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
      });

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
        controller: diaryController,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }

  showGraphDialog(height, width, BuildContext context) {
    double height1 = height;
    double width1 = width;
    Widget cancelButton = TextButton(
      child: Text("Exit"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget graph =
    Container(
      height: height1 / 4,
      width: width1,
      child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              piechart.PieChart(
                chartRadius: width1,
                dataMap: dataMap,
                chartType: ChartType.ring,
                centerText: "Mood Frequency",
                baseChartColor: Colors.grey[300]!,
                colorList: colorList,
              ),
            ]
      )
      )
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Mood Chart"),
      content: Text(
          "Mood Over Last 30 Days"),
      actions: [
        graph,
        cancelButton
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

  Widget meScreenButton(BuildContext context, String screenName) {
    Widget goto = MeScreen();
    IconData screenIcon = Icons.account_circle;
    switch (screenName) {
      case "Profile":
        goto = ProfileScreen();
        screenIcon = Icons.account_circle_outlined;
        break;
      case "Recommendations":
        goto = RecommendationScreen();
        screenIcon = Icons.star_border_outlined;
        break;
      case "Find a Health Care Center":
        goto = MapScreen();
        screenIcon = Icons.location_on_outlined;
        break;
      case "Onboarding":
        goto = OnboardingScreen();
        screenIcon = Icons.offline_bolt_outlined;
        break;
    }

    LinearGradient grad = AppConstants.getGradByMood("blue");
    Color color = AppConstants.getColorByMood("cyan");
    const double radius = 10;
    double buttonMinHeight = 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: (ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => (goto)));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            fixedSize:
            MaterialStateProperty.all<Size>(Size(0, buttonMinHeight)),
            alignment: Alignment.centerLeft),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                color: AppColors.font,
                onPressed: () {},
                icon: Icon(
                  screenIcon,
                  size: 20,
                )),
            Text("${screenName}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            Spacer(),
            IconButton(
                color: AppColors.font,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => (goto)));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )),
          ],
        ),
      )),
    );
  }
}

class RadioIcon extends StatefulWidget {
  @override
  _RadioIconState createState() => _RadioIconState();
}

class _RadioIconState extends State<RadioIcon> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon(0, text: "Sad", icon: Icons.sentiment_dissatisfied_outlined),
        _icon(1, text: "Neutral", icon: Icons.sentiment_neutral_outlined),
        _icon(2, text: "Happy", icon: Icons.sentiment_very_satisfied_outlined),
      ],
    );
  }

  Widget _icon(int index, {required String text, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkResponse(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: _selected == index ? Colors.green : null,
            ),
            Text(text, style: TextStyle(color: _selected == index ? Colors.green : null)),
          ],
        ),
        onTap: () => setState(
              () {
            _selected = index;
            if (index == 2) {
                dataMap["Happy"] = (dataMap["Happy"]! + 1);
            }
            else if (index == 1) {
              dataMap["Neutral"] = (dataMap["Neutral"]! + 1);
            }
            else if (index == 0) {
              dataMap["Sad"] = (dataMap["Sad"]! + 1);
            }

          },
        ),
      ),
    );
  }
}
