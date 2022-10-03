import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relieflink/recommendations/recommendations.dart';

import '../utils/constants.dart';

class RecommendationScreen extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            recommendations[0].icon, Text(recommendations[0].title + ' - ' + recommendations[0].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[1].icon, Text(recommendations[1].title + ' - ' + recommendations[1].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[2].icon, Text(recommendations[2].title + ' - ' + recommendations[2].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[3].icon, Text(recommendations[3].title + ' - ' + recommendations[3].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[4].icon, Text(recommendations[4].title + ' - ' + recommendations[4].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[5].icon, Text(recommendations[5].title + ' - ' + recommendations[5].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
            recommendations[6].icon, Text(recommendations[6].title + ' - ' + recommendations[6].description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,)),
          ]
        )
      )
    );
  }
}