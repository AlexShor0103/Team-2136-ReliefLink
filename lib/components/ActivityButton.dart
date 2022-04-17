import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget{
  final String name, mood;
  final int duration;
  final Function handler;
  const ActivityButton({Key? key, required this.name, required this.duration, required this.mood, required this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color color; 
    const double radius = 10;
    double deviceHeight = MediaQuery.of(context).size.height;
    double buttonMinHeight = deviceHeight * 0.13;
    bool liked = false;
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
      onPressed: () => (this.handler()), 
      child: Column(children: [ Container(alignment: Alignment.topRight,child: IconButton(onPressed: () {}, icon: Icon(Icons.star_outline_outlined), color: Colors.white)),
        Text(this.name, style: TextStyle(color: Colors.white), textAlign: TextAlign.center)]), 
      
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
        elevation: MaterialStateProperty.all<double>(4.0),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
        
      ),
      fixedSize: MaterialStateProperty.all<Size>(Size(0, buttonMinHeight))
      ));
    return button;
  }

}