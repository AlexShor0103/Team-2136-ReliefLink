import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

import '../../screens/ReliefHomeScreen.dart';
import '../ReliefActivity/ReliefRateScreen.dart';
import '../ReliefActivity/ReliefScreen.dart';
import '../../utils/relief_technique_utils.dart';

class ActivityButton extends StatelessWidget {
  final ReliefTechniqueData activity;
  const ActivityButton({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color color;
    const double radius = 10;
    double deviceHeight = MediaQuery.of(context).size.height;
    double buttonMinHeight = deviceHeight * 0.125;
    color = AppConstants.getColorByMood(activity.mood);
    ElevatedButton button = ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReliefScreen(data: activity)));
        },
        child: Align(
          child: Text(activity.activityName,
              style: TextStyle(color: Colors.white)),
          alignment: Alignment.center,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            fixedSize:
                MaterialStateProperty.all<Size>(Size(0, buttonMinHeight))));
    return button;
  }
}
