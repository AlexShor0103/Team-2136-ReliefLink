import 'package:flutter/material.dart';
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
        activities.sort((a, b) => b.favorite ? -1 : 1);
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
    List<Widget> rowComponents = [];
    int durationRemainingCounter = 90;
    widgetList = [];
    for (int i = 0; i < activitiesList.length; i++) {
      if (durationRemainingCounter - activitiesList[i].duration < 0) {
        widgetList.add(Row(
            children: rowComponents,
            mainAxisAlignment: MainAxisAlignment.spaceBetween));
        rowComponents = [];
        rowComponents.add(Flexible(
            fit: FlexFit.tight,
            flex: ((90 - activitiesList[i].duration) / 10).round(),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ActivityButton(activity: activitiesList[i]))));
        durationRemainingCounter = 90 - activitiesList[i].duration;
      } else {
        rowComponents.add(Flexible(
            fit: FlexFit.tight,
            flex: ((90 - activitiesList[i].duration) / 10).round(),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ActivityButton(activity: activitiesList[i]))));
        durationRemainingCounter -= activitiesList[i].duration;
      }
    }
    if (rowComponents.isNotEmpty) {
      widgetList.add(Row(children: rowComponents));
    }
    return Column(children: widgetList);
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
