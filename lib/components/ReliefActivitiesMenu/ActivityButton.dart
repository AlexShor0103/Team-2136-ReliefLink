import 'dart:html';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

import '../../screens/ReliefHomeScreen.dart';
import '../ReliefActivity/ReliefRateScreen.dart';
import '../ReliefActivity/ReliefScreen.dart';
import '../../utils/relief_technique_utils.dart';

class ActivityButton extends StatefulWidget {
  final ReliefTechniqueData activity;
  const ActivityButton({Key? key, required this.activity}) : super(key: key);

  @override
  State<ActivityButton> createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  IconData iconData = Icons.star;

  @override
  Widget build(BuildContext context) {
    Color color;
    LinearGradient grad = AppConstants.getGradByMood(widget.activity.mood);
    const double radius = 10;
    double deviceHeight = MediaQuery.of(context).size.height;

    double buttonMinHeight = deviceHeight * 0.13;
    setState(() {
      iconData = widget.activity.favorite ? Icons.star : Icons.star_outline;
    });

    color = AppConstants.getColorByMood(widget.activity.mood);

    ElevatedButton button = ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReliefScreen(data: widget.activity)));
      },
      style: ButtonStyle(
          //sets background color of buttons to white
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
          //pushes everything inside towards edges. Except I'm not sure why the text still aligns center (though it may be due to column)
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
          fixedSize: MaterialStateProperty.all<Size>(Size(0, buttonMinHeight)),
          alignment: Alignment.topLeft),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: grad,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
              ),
            ),
            height: buttonMinHeight * 0.25,
          ),
          Text(widget.activity.activityName,
              style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w800,
                fontSize: 17,
              )),
          Text('${widget.activity.duration} min',
              style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w200,
                  fontSize: 17)),
          IconButton(
              color: AppColors.font,
              onPressed: () {
                widget.activity.toggleActivityFavorite();
                setState(() {
                  iconData =
                      iconData == Icons.star ? Icons.star_outline : Icons.star;
                });
              },
              icon: Icon(
                iconData,
                size: 20,
              )),
        ],
      ),
    );

    return button;
  }
}
