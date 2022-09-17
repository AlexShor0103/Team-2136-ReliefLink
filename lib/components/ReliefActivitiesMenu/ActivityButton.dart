import 'package:flutter/material.dart';

import '../../screens/ReliefHomeScreen.dart';
import '../ReliefActivity/ReliefRateScreen.dart';
import '../ReliefActivity/ReliefScreen.dart';
import '../../utils/relief_technique_utils.dart';

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
        //Sensible text fields may be impossible with ElevatedButton. Ideally, certain text would be styled differently. Brief search suggests using 'Rich Text' widgets
      child: Align(child: Text('${activity.activityName}\nEstimated Time: ${activity.duration.toString()} minutes\nIf you feel: ${activity.mood}',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900)), alignment: Alignment.topLeft,),
      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
        
      ),
      fixedSize: MaterialStateProperty.all<Size>(Size(0, buttonMinHeight))
      ));
    return button;
  }

}