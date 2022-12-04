import 'package:flutter/material.dart';
import 'package:relieflink/components/Profile/ProfileScreen.dart';
import 'package:relieflink/recommendations/RecommendationScreen.dart';
import 'package:relieflink/screens/MapScreen.dart';

import '../utils/constants.dart';
import 'OnboardingScreen.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              height: 20,
            ),
            meScreenButton(context, "Recommendations"),
            const SizedBox(
              height: 20,
            ),
            meScreenButton(context, "Find a Health Care Center"),
            const SizedBox(
              height: 20,
            ),
            meScreenButton(context, "Onboarding")
          ],
        ),
      ),
    );
  }

  Widget meScreenButton(BuildContext context, String screenName) {
    Widget goto = MeScreen();
    IconData screenIcon = Icons.account_circle;
    switch (screenName) {
      case "Profile":
        goto = ProfileScreen();
        screenIcon = Icons.account_circle_outlined;
        break;
      case "Recommendations":
        goto = RecommendationScreen();
        screenIcon = Icons.star_border_outlined;
        break;
      case "Find a Health Care Center":
        goto = MapScreen();
        screenIcon = Icons.location_on_outlined;
        break;
      case "Onboarding":
        goto = OnboardingScreen();
        screenIcon = Icons.offline_bolt_outlined;
        break;
    }

    LinearGradient grad = AppConstants.getGradByMood("blue");
    Color color = AppConstants.getColorByMood("cyan");
    const double radius = 10;
    double buttonMinHeight = 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: (ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => (goto)));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            fixedSize:
                MaterialStateProperty.all<Size>(Size(0, buttonMinHeight)),
            alignment: Alignment.centerLeft),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                color: AppColors.font,
                onPressed: () {},
                icon: Icon(
                  screenIcon,
                  size: 20,
                )),
            Text("${screenName}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            Spacer(),
            IconButton(
                color: AppColors.font,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => (goto)));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )),
          ],
        ),
      )),
    );
  }
}
