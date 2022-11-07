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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          //adjust the paddings from the two edges
          children: [
            const SizedBox(
              height: 20,
            ),
            meScreenButton(context, "Profile"),

            meScreenButton(context, "Recommendations"),

            meScreenButton(context, "Find a Health Care Center Near You"),
            MaterialButton(
              color: AppColors.orange,
              height: 80.0,
              minWidth: 70.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Mood Tracker"),
                    content: const Text("Please enter how you are feeling so far today."),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.sentiment_very_dissatisfied_outlined),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        iconSize: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          icon: const Icon(Icons.sentiment_dissatisfied_outlined),
                          iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        iconSize: 30,
                        icon: const Icon(Icons.sentiment_neutral_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        iconSize: 30,
                        icon: const Icon(Icons.sentiment_satisfied_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        iconSize: 30,
                        icon: const Icon(Icons.sentiment_very_satisfied_outlined),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.mood_outlined),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                      child: Text(
                        "How are you feeling today?",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget meScreenButton(BuildContext context, String screenName) {
    Widget goto = ProfileScreen();
    IconData screenIcon = Icons.account_circle;
    switch (screenName) {
      case "Profile":
        goto = ProfileScreen();
        screenIcon = Icons.account_circle;
        break;
      case "Recommendations":
        goto = RecommendationScreen();
        screenIcon = Icons.airline_stops;
        break;
      case "Find a Health Care Center Near You":
        goto = MapScreen();
        screenIcon = Icons.location_on_outlined;
        break;
      case "How are you feeling today?":
        goto = MeScreen();
        screenIcon  = Icons.mood_outlined;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: (MaterialButton(
        color: AppColors.orange,
        height: 80.0,
        minWidth: 70.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => (goto)));
        },
        child: Row(
          children: [
            Icon(screenIcon),
            SizedBox(
              width: 30,
            ),
            Flexible(
                child: Text(
              "${screenName}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      )),
    );
  }
}
