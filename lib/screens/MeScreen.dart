import 'package:flutter/material.dart';
import 'package:relieflink/components/Profile/ProfileScreen.dart';
import 'package:relieflink/recommendations/RecommendationScreen.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
          children: [
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen())); },
              child: Column(
                children: const [
              Icon(
                  Icons.account_circle
              ),
                  Text('Profile'),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => RecommendationScreen())); },
              child: Column(
                children: const [
                  Icon(
                      Icons.airline_stops,
                  ),
                  Text('Recommendations'),
                ],
              ),
            ),
          ],
        ),
    );
  }
}