import 'package:flutter/material.dart';
import 'package:relieflink/components/Profile/ProfileScreen.dart';
import 'package:relieflink/recommendations/RecommendationScreen.dart';
import 'package:relieflink/screens/MapScreen.dart';

import '../utils/constants.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.bg,
        body: ListView(
          padding: const EdgeInsets.only(left: 650.0, right: 650.0),
          //adjust the paddings from the two edges
          children: [
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              color: AppColors.orange,
              height: 80.0,
              minWidth: 70.0,
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
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              color: AppColors.orange,
              height: 80.0,
              minWidth: 70.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecommendationScreen()));
              },
              child: Column(
                children: const [
                  Icon(Icons.airline_stops),
                  Text('Recommendations'),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              color: AppColors.orange,
              height: 80.0,
              minWidth: 70.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapScreen()));
              },
              child: Column(
                children: const [
                  Icon(Icons.location_on_outlined),
                  Text('Find a Conselor Near You'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
