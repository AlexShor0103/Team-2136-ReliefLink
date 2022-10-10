import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relieflink/recommendations/recommendations.dart';
import 'package:store_redirect/store_redirect.dart';
import 'RecommendationButton.dart';

import '../utils/constants.dart';

class RecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            RecommendationButton(rec: recommendations[0]),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[0].title +
                          ' - ' +
                          recommendations[0].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[0].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[1].title +
                          ' - ' +
                          recommendations[1].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[1].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[2].title +
                          ' - ' +
                          recommendations[2].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[2].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[3].title +
                          ' - ' +
                          recommendations[3].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[3].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[4].title +
                          ' - ' +
                          recommendations[4].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[4].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[5].title +
                          ' - ' +
                          recommendations[5].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[5].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: 'com.getsomeheadspace.android',
                  iOSAppId: '493145008',
                );
              },
              child: Column(
                children: [
                  Text(
                      recommendations[6].title +
                          ' - ' +
                          recommendations[6].description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      )),
                  IconButton(
                    icon: recommendations[6].icon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ])));
  }
}
