import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget{
  final String name, mood;
  final int duration;
  const ActivityButton({Key? key, required this.name, required this.duration, required this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color color; 
    const double radius = 10;
    if (mood == "Anxious") {
      color = Color(0xff8CC9BA);
    } else if (mood == "Sleepless") {
      color = Color(0xffFC8D7A);
    } else if (mood == "Energetic") {
      color = Color(0xffF9CB9A);
    } else {
        color = Color(0xffC5D7BF);
    }
    OutlinedButton button = OutlinedButton(
      onPressed: () {}, 
      child: Text(this.name), 
  
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)))
      )));
    return button;
  }

}