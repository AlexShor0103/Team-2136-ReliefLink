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
    var categories = [];
    var buckets = [];
    switch (sort) {
      case SortOptions.FAVORITE:
        buckets = [[], []];
        activitiesList.sort((a, b) => b.favorite ? 1 : -1);
        for (var activity in activitiesList) {
          if (activity.favorite) {
            buckets[0].add(activity);
          } else {
            buckets[1].add(activity);
          }
        }
        categories = ['Favorites', 'Non-favorites'];
        break;
      case SortOptions.MOOD:
        buckets = [[], [], [], []];
        activitiesList.sort(
            (a, b) => a.mood.toLowerCase().compareTo(b.mood.toLowerCase()));

        for (var activity in activitiesList) {
          if (activity.mood.toLowerCase() == 'anxious') {
            buckets[0].add(activity);
          } else if (activity.mood.toLowerCase() == 'sleepless') {
            buckets[1].add(activity);
          } else if (activity.mood.toLowerCase() == 'energetic') {
            buckets[2].add(activity);
          } else {
            buckets[3].add(activity);
          }
        }
        categories = ['Anxious', 'Sleepless', 'Energetic', 'Other'];
        break;
      case SortOptions.TIME:
        activitiesList.sort((a, b) => a.duration - b.duration);
        buckets = [[], [], [], []];

        for (var activity in activitiesList) {
          if (activity.duration <= 15) {
            buckets[0].add(activity);
          } else if (activity.duration > 15 && activity.duration <= 30) {
            buckets[1].add(activity);
          } else if (activity.duration > 30 && activity.duration <= 60) {
            buckets[2].add(activity);
          } else {
            buckets[3].add(activity);
          }
        }
        categories = [
          '1-15 minutes',
          '15-30 minutes',
          '30-60 minutes',
          '60+ minutes'
        ];
        break;
      case SortOptions.RATING:
        activitiesList.sort((a, b) {
          double diff = a.averageRating - b.averageRating;
          if (diff < 0) {
            return 1;
          }
          if (diff > 0) {
            return -1;
          }
          return 0;
        });

        buckets = [[], [], [], [], [], []];
        for (ReliefTechniqueData activity in activitiesList) {
          double rating = activity.averageRating;
          // Note: unrated activities have ratings of -1
          if (rating >= 4) {
            buckets[0].add(activity);
          } else if (rating >= 3) {
            buckets[1].add(activity);
          } else if (rating >= 2) {
            buckets[2].add(activity);
          } else if (rating >= 1) {
            buckets[3].add(activity);
          } else if (rating > -0.5) {
            buckets[4].add(activity);
          } else {
            buckets[5].add(activity);
          }
        }
        categories = [
          '4 to 5',
          '3 to 4',
          '2 to 3',
          '1 to 2',
          'Less than 1',
          'Not Rated'
        ];
        break;
      default:
        categories = ['All'];
        buckets = [activitiesList];
    }
    widgetList = [];
    for (int i = 0; i < buckets.length; i++) {
      widgetList.add(Padding(
          padding: EdgeInsets.all(10),
          child: Text(categories[i],
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ))));
      List<Widget> grid = [];
      for (var activity in buckets[i]) {
        if (options.searchString == '' ||
            activity.activityName
                .toLowerCase()
                .contains(options.searchString.toLowerCase())) {
          grid.add(
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ActivityButton(
                    activity: activity, updateParent: updateActivities)),
          );
        }
      }

      var finalGrid = GridView.count(
        childAspectRatio: MediaQuery.of(context).size.width < 420 ? 1 : 1.3,
        primary: true,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: grid,
      );

      if (grid.isEmpty) {
        widgetList.removeLast();
      } else {
        widgetList.add(finalGrid);
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.all(10.0), child: buildBoxes(value)),
          );
        });
  }
}
