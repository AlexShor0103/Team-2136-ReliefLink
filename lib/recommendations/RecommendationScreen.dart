import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relieflink/recommendations/recommendations.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

import '../utils/constants.dart';

class RecommendationScreen extends StatelessWidget {

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
              height: 80,
            ),
            backButton(context),
            recommendationButton(0),
            recommendationButton(1),
            recommendationButton(2),
            recommendationButton(3),
            recommendationButton(4),
            recommendationButton(5),
            recommendationButton(6),
          ],
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return (MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (MeScreen())));
      },
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.chevron_left_outlined),
              iconSize: 30,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (MeScreen())));
              }),
          Text(
            "Back",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    ));
  }

  Widget recommendationButton(int index) {
    LinearGradient grad = AppConstants.getGradByMood("blue");
    Color color = AppConstants.getColorByMood("cyan");
    const double radius = 10;
    double buttonMinHeight = 120;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: (ElevatedButton(
        onPressed: () {
          if (!kIsWeb) {
            StoreRedirect.redirect(
              androidAppId: recommendations[index].androidAppId,
              iOSAppId: recommendations[index].iOSAppId,
            );
          } else {
            launchUrl(Uri.parse(recommendations[index].webUrl),
              webOnlyWindowName: '_self',
            );
          }
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
            SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 120,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommendations[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    recommendations[index].description,
                    style: const TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            IconButton(
              color: AppColors.font,
              icon: Icon(Icons.arrow_circle_right_outlined),
              onPressed: () {
                if (!kIsWeb) {
                  StoreRedirect.redirect(
                    androidAppId: recommendations[index].androidAppId,
                    iOSAppId: recommendations[index].iOSAppId,
                  );
                } else {
                  launchUrl(Uri.parse(recommendations[index].webUrl),
                    webOnlyWindowName: '_self',
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
