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
            const SizedBox(
              height: 60,
            ),
            meScreenButton(context, "Recommendations"),
            const SizedBox(
              height: 60,
            ),
            meScreenButton(context, "Find a Health Care Center Near You"),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Mood Tracker"),
                    content: const Text("You have raised a Alert Dialog Box"),
                    actions: <Widget>[
                      IconButton(
                        icon: Image.asset('lib/assets/sad.png'),
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: Image.asset('lib/assets/poor.png'),
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: Image.asset('lib/assets/okay.png'),
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: Image.asset('lib/assets/good.png'),
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: Image.asset('lib/assets/great.png'),
                        onPressed: () {  },
                      ),
                    ],
                  ),
                );
              },
              child: const Text("How are you feeling today?"),
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
