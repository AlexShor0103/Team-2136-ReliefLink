
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
    LinearGradient grad = AppConstants.getGradByMood(widget.activity.mood);
    Color color = AppConstants.getColorByMood(widget.activity.mood);

    const double radius = 10;
    double buttonMinHeight = 130;

    setState(() {
      iconData = widget.activity.favorite ? Icons.star : Icons.star_outline;
    });

    ElevatedButton button = ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReliefScreen(data: widget.activity)));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
          fixedSize: MaterialStateProperty.all<Size>(Size(0, buttonMinHeight)),
          alignment: Alignment.topLeft),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: grad,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
              ),
            ),
            height: buttonMinHeight * 0.2,
          ),
          const Spacer(),
          Text(widget.activity.activityName,
              textAlign: TextAlign.center,
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
                  fontSize: 16)),
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
          const Spacer(),
        ],
      ),
    );

    return Container(child: button);
  }
}
