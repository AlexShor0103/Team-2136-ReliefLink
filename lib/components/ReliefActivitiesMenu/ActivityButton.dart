import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

import '../../screens/ReliefHomeScreen.dart';
import '../ReliefActivity/ReliefRateScreen.dart';
import '../ReliefActivity/ReliefScreen.dart';
import '../../utils/relief_technique_utils.dart';


// this class
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
    const double radius = 10;
    double deviceHeight = MediaQuery.of(context).size.height;
    double buttonMinHeight = deviceHeight * 0.125;
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
        child: Align(
          child: Column(children: [
            const Spacer(),
            Text(widget.activity.activityName,
                style: const TextStyle(color: AppColors.white)),
            IconButton(
                onPressed: () {
                  // Set favorite
                  widget.activity.toggleActivityFavorite();
                  setState(() {
                    iconData = iconData == Icons.star
                        ? Icons.star_outline
                        : Icons.star;
                  });
                },
                icon: Icon(
                  iconData,
                  size: 20,
                )),
            const Spacer(),
          ]),
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
