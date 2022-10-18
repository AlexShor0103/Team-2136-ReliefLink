import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relieflink/recommendations/recommendations.dart';
import 'package:store_redirect/store_redirect.dart';

import '../utils/constants.dart';

class RecommendationScreen extends StatelessWidget {
  static const androidAppId = 'com.getsomeheadspace.android';
  static const iOSAppId = '493145008';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.bg,
        body: ListView(
          padding: const EdgeInsets.only(left: 380.0, right: 380.0),
          //adjust the paddings from the two edges
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "Other Recommended Apps",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 30,
            ),
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

  Widget recommendationButton(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: (MaterialButton(
        color: AppColors.green,
        height: 70.0,
        minWidth: 70.0,
        onPressed: () {
          StoreRedirect.redirect(
            androidAppId: androidAppId,
            iOSAppId: iOSAppId,
          );
        },
        child: Row(
          children: [
            IconButton(
              icon: recommendations[index].icon,
              onPressed: () {},
              padding: EdgeInsets.only(right: 15),
            ),
            Text(
              recommendations[index].title +
                  ' - ' +
                  recommendations[index].description,
              style: const TextStyle(
                fontSize: 20,
              ),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      )),
    );
  }
}
