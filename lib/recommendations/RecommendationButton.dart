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
    const double radius = 20;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(color: AppColors.font.withOpacity(0.25),
            spreadRadius: 7,
            blurRadius: 10,
          )
        ]
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10),
            child: 
            Row(
              children: [
                rec.icon,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(rec.title,
                    style: const TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    )
                  )
                ),
              ],
            ),
          ),
          
          
          Text(rec.description,
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            )
          ),
        ]
      )
    );
    // return Container(
    //   // width: 200,
    //   height: 100,
    //   constraints: BoxConstraints.expand(height: 100),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(radius)),
    //     color: AppColors.white,
    //     boxShadow: [
    //       BoxShadow(color: AppColors.black.withOpacity(0.25),
    //         spreadRadius: 7,
    //         blurRadius: 10,
    //       )
    //     ]
    //   ),

    //   child: Center(
    //     child: Text(rec.title,
    //       style: const TextStyle(
    //         color: AppColors.font,
    //         fontFamily: 'MainFont',
    //         fontWeight: FontWeight.w800,
    //         fontSize: 17,
    //       )
    //     ),
    //   ),
    // );
  }
}
