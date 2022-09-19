import 'dart:html';

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
      
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
          fixedSize:
              MaterialStateProperty.all<Size>(Size(0, buttonMinHeight))),
      
      child: Align(
        child: Column(children: [
          const Spacer(),
          // this is the text for the activity
          Text(widget.activity.activityName,
              style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w800,
                fontSize: 17)),
          //const Spacer(),
          // duration text
          Text(
            '${widget.activity.duration} min',
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w200,
              fontSize: 17)
          ),
          //const Spacer(),
          //favorites button
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
      );
    
    ElevatedButton button2 = ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReliefScreen(data: widget.activity)));
      },
      
      style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all<Color>(color),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 255, 255, 1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
          //pushes everything inside towards edges
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(0)),
          fixedSize:
              MaterialStateProperty.all<Size>(Size(0, buttonMinHeight)),
          alignment: Alignment.topCenter),
      child: Column(
        children: [
          Container(
            
            decoration: const BoxDecoration(
              gradient: AppGrads.sunset,
              // borderRadius: BorderRadius.all(radius),
            ),
            height: buttonMinHeight * 0.3,
          ),

        ],)
    //   child: Ink(
    //     decoration: const BoxDecoration(
          
    //       gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
    //         begin: Alignment.centerLeft,
    //         end: Alignment.centerRight,
    //       ),
    //       borderRadius: BorderRadius.circular(radius),
    //     ),
    //     height: buttonMinHeight * 0.3,
    //   ),

    );
    
    return button2;
  }



        /*
      I AM THINKING OF MAKING GRADIENTS USING PARTS OF THIS CODE

      Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
      */
}
