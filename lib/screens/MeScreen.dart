import 'package:flutter/material.dart';
import 'package:relieflink/components/Profile/ProfileScreen.dart';
import 'package:relieflink/recommendations/RecommendationScreen.dart';
import 'package:relieflink/screens/MapScreen.dart';

import 'OnboardingScreen.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: Column(
            children: const [
              Icon(Icons.account_circle),
              Text('Profile'),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecommendationScreen()));
          },
          child: Column(
            children: const [
              Icon(
                Icons.airline_stops,
              ),
              Text('Recommendations'),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            },
            child: Column(children: const [
              Icon(
                Icons.location_on_outlined,
              ),
              Text('Find a Counselor Near You'),
            ])),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()));
            },
            child: Column(children: const [
              Icon(
                Icons.stacked_bar_chart_rounded,
              ),
              Text('Onboarding'),
            ]))
      ]),
    );
  }
}
