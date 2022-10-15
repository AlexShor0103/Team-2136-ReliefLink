import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:relieflink/utils/constants.dart';
import '../../activities/activities.dart';
import '../../utils/relief_technique_utils.dart';
import 'ActivityButton.dart';
import '../../utils/data_storage.dart';

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

  @override
  void initState() {
    super.initState();
    updateActivities();
  }

  void updateActivities() {
    List<ReliefTechniqueData>? data = DataStorage.getReliefTechniqueDataList();
    if (data == null) {
      DataStorage.init().then((success) {
        activitiesList = DataStorage.getReliefTechniqueDataList()!;
        setState(() {});
      });
    } else {
      activitiesList = data;
      setState(() {});
    }
  }

  Widget buildBoxes(SearchAndSortOptions options) {
    var sort = options.sortOption;
    switch (sort) {
      case SortOptions.NONE:
        break;
      case SortOptions.FAVORITE:
        activitiesList.sort((a, b) => b.favorite ? 1 : -1);
        break;
      case SortOptions.MOOD:
        activitiesList.sort(
            (a, b) => a.mood.toLowerCase().compareTo(b.mood.toLowerCase()));
        break;
      case SortOptions.TIME:
        activitiesList.sort((a, b) => a.duration - b.duration);
        break;
      default:
    }
    widgetList = [];
    for (int i = 0; i < activitiesList.length; i++) {
      if (options.searchString == '' ||
          activitiesList[i]
              .activityName
              .toLowerCase()
              .contains(options.searchString.toLowerCase())) {
        widgetList.add(
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ActivityButton(activity: activitiesList[i], updateParent: updateActivities)
          ),
        );
      }
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
    return ValueListenableBuilder<SearchAndSortOptions>(
        valueListenable: AppConstants.sortingOptions.optionNotifier,
        builder: (context, value, _) {
          return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:  buildBoxes(value)
              ), 
             );
        });
  }
}
