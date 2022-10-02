import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:relieflink/utils/constants.dart';
import '../../activities/activities.dart';
import '../../utils/relief_technique_utils.dart';
import 'ActivityButton.dart';

class ReliefActivityBoxContainer extends StatefulWidget {
  const ReliefActivityBoxContainer({Key? key}) : super(key: key);

  @override
  State<ReliefActivityBoxContainer> createState() {
    return ReliefActivityBoxContainerState();
  }
}

class ReliefActivityBoxContainerState
    extends State<ReliefActivityBoxContainer> {
  List<ReliefTechniqueData> activitiesList = activities;
  List<Widget> widgetList = [];

  Widget buildBoxes(SortOptions sort) {
    switch (sort) {
      case SortOptions.NONE:
        break;
      case SortOptions.FAVORITE:
        activities.sort((a, b) => b.favorite ? 1 : -1);
        break;
      case SortOptions.MOOD:
        activities.sort(
            (a, b) => a.mood.toLowerCase().compareTo(b.mood.toLowerCase()));
        break;
      case SortOptions.TIME:
        activities.sort((a, b) => a.duration - b.duration);
        break;
      default:
    }
    widgetList = [];
    for (int i = 0; i < activitiesList.length; i++) {
      widgetList.add(
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: ActivityButton(activity: activitiesList[i])),
      );
    }

    return GridView.count(
      childAspectRatio: 1.5,
      primary: true,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: widgetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SortOptions>(
        valueListenable: AppConstants.sortingOptions.optionNotifier,
        builder: (context, value, _) {
          return SingleChildScrollView(
              physics: BouncingScrollPhysics(), child: buildBoxes(value));
        });
  }
}
