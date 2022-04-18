import 'package:flutter/material.dart';

import '../ReliefHomeScreen.dart';
import '../relief_rate_screen.dart';
import '../relief_screen.dart';
import '../relief_technique_utils.dart';

class ActivityButton extends StatelessWidget{
  final ReliefTechniqueData activity;
  const ActivityButton({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color color; 
    const double radius = 10;
    double deviceHeight = MediaQuery.of(context).size.height;
    double buttonMinHeight = deviceHeight * 0.125;
    if (activity.mood == "Anxious") {
      color = Color(0xff8CC9BA);
    } else if (activity.mood == "Sleepless") {
      color = Color(0xffFC8D7A);
    } else if (activity.mood == "Energetic") {
      color = Color(0xffF9CB9A);
    } else {
        color = Color(0xffC5D7BF);
    }
    ElevatedButton button = ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ReliefScreen(data: activity)));
      }, 
      child: Align(child: Text(activity.activityName, style: TextStyle(color: Colors.white)), alignment: Alignment.center,), 
    
      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
        
      ),
      fixedSize: MaterialStateProperty.all<Size>(Size(0, buttonMinHeight))
      ));
    return button;
  }

}