import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivitiesMenu/SearchContainer.dart';
import 'package:relieflink/utils/constants.dart';

import '../components/ReliefActivitiesMenu/ActivitiesContainer.dart';
import '../components/ReliefActivitiesMenu/SortContainer.dart';

class ReliefHomeScreen extends StatelessWidget {
  const ReliefHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: ListView(children: <Widget>[
        SearchContainer(),
        SortContainer(),
        ReliefActivityBoxContainer()
      ]),
    );
  }
}
