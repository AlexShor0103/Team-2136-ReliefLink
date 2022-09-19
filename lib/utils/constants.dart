import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppConstants {
  static final sortingOptions = ActivitiesSorting();
  static setSortActivitiesBy(SortOptions sortOption) {
    sortingOptions.optionNotifier.value = sortOption;
  }

  // static final colorLib ={
  //   'cyan'
  // }

  static final colorsByMood = {
    'anxious': AppColors.cyan,
    'sleepless': AppColors.red,
    'energetic': AppColors.orange,
    'other': AppColors.green
  };

  static Color getColorByMood(String mood) {
    var color = colorsByMood[mood.toLowerCase()];
    return color ?? const Color(0x0);
  }

  static getColorByName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'cyan':
        return AppColors.cyan;
      case 'red':
        return AppColors.red;
      case 'orange':
        return AppColors.orange;
      case 'green':
        return AppColors.green;
      default:
        return 'orange';
    }
  }
}

class AppColors {
  static const cyan = Color(0xff8CC9BA);
  static const red = Color(0xffFC8D7A);
  static const orange = Color(0xffF9CB9A);
  static const green = Color(0xffC5D7BF);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const red2 = Color.fromRGBO(230, 81, 86, 1);
  static const grey = Color.fromRGBO(90, 90, 90, 1);
  static const font = Color.fromRGBO(81, 69, 106, 1);
}

// This will be a class containing the gradients we use in our application
class AppGrads {
  static const blue = LinearGradient(
    colors: [Color.fromRGBO(127, 197, 237, 1), Color.fromRGBO(185, 255, 173, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const purple = LinearGradient(
    colors: [Color.fromRGBO(130, 165, 255, 1), Color.fromRGBO(255, 130, 227, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const green = LinearGradient(
    colors: [Color.fromRGBO(149, 240, 141, 1), Color.fromRGBO(192, 249, 119, 1), Color.fromRGBO(255, 232, 174, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const orange = LinearGradient(
    colors: [Color.fromRGBO(255, 184, 119, 1), Color.fromRGBO(255, 235, 163, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const sunset = LinearGradient(
    colors: [Color.fromRGBO(219, 142, 211, 1), Color.fromRGBO(255, 125, 153, 1), Color.fromRGBO(255, 169, 132, 1), Color.fromRGBO(255, 225, 147, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class ActivitiesSorting with ChangeNotifier {
  ValueNotifier<SortOptions> optionNotifier =
      ValueNotifier<SortOptions>(SortOptions.NONE);
}

enum SortOptions { NONE, FAVORITE, MOOD, TIME }
