import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

import '../components/ReliefActivitiesMenu/ActivitiesContainer.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({ Key? key }) : super(key: key);

  Widget build(BuildContext context) {
    AppConstants.setSortActivitiesBy(SortOptions.FAVORITE);

    return Container(
      color: AppColors.bg,
      child: ListView(children: const <Widget>[
        SingleChildScrollView(child: ReliefActivityBoxContainer())]),
    );
  }
}
