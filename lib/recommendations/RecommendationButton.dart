import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'RecommendationScreen.dart';
import 'recommendation_panel.dart';

class RecommendationButton extends StatelessWidget {
  final RecommendationPanel rec;
  const RecommendationButton({Key? key, required this.rec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 10;

    return Container(
      // width: 200,
      height: 100,
      constraints: BoxConstraints.expand(height: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: AppColors.font,
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 13,
          )
        ]
      ),
      
      child: Center(
        child: Text(rec.title,
          style: const TextStyle(
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.w800,
            fontSize: 17,
          )
        ),
      ),
    );
  }
}
