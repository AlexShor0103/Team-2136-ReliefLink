import 'package:flutter/material.dart';
import 'package:relieflink/relief_rate_screen.dart';
import 'package:relieflink/relief_screen.dart';
import 'package:relieflink/relief_technique_utils.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home: ReliefScreen(data: ReliefTechniqueData(videoId: "syx3a1_LeFo", activityName: "Guided Meditation")),
      home: ReliefRateScreen(data: ReliefTechniqueData(videoId: "syx3a1_LeFo", activityName: "Guided Meditation"))
    );
  }
}