import 'package:flutter/material.dart';
import '../activities/activities.dart';
import './ActivityButton.dart';
class ReliefActivityBoxContainer extends StatefulWidget {
  const ReliefActivityBoxContainer({Key? key}) : super(key: key);



    // TODO: implement createState
    @override
    State<ReliefActivityBoxContainer> createState() {
  
          return ReliefActivityBoxContainerState();
  }

  
  
}
class ReliefActivityBoxContainerState extends State<ReliefActivityBoxContainer> {
  List<Activity> activitiesList =  activities;
  List<Widget> widgetList = [];
  List<Widget> buildBoxes() {
  List<Widget> rowComponents = [];
      int durationRemainingCounter = 90;
      for (int i = 0; i < activitiesList.length; i++) {
        
        if (durationRemainingCounter - activitiesList[i].duration < 0) {
          
          widgetList.add(Expanded(child: Row(children: rowComponents)));
          rowComponents = [];
          rowComponents.add(Expanded(child: ActivityButton(name: activitiesList[i].name, duration: activitiesList[i].duration, mood: activitiesList[i].mood)));
          durationRemainingCounter = 90 - activitiesList[i].duration;
          

        } else {
          
          rowComponents.add(Expanded(child: ActivityButton(name: activitiesList[i].name, duration: activitiesList[i].duration, mood: activitiesList[i].mood)));
          durationRemainingCounter -= activitiesList[i].duration;
        }
        
      }
    if (rowComponents.isNotEmpty) {
      widgetList.add(Expanded(child: Row(children: rowComponents)));
    }
      return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: buildBoxes());
    
  }

}