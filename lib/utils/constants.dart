import 'package:flutter/cupertino.dart';

//when strings need to be passed by reference
class StringWrapper {
  var value;
  StringWrapper(this.value);
}
class AppConstants {
  // ACTIVITY SORTING

  // To navigate to the home screen with any specific sorting, add the sorting preference
  // using the method below and then navigate.
  // That will lead you to the desired page with the sorting.
  static final sortingOptions = ActivitiesSorting();
  static setSortActivitiesBy(SortOptions sortOption) {
    sortingOptions.optionNotifier.value =
        SearchAndSortOptions(searchString, sortOption);
  }

  static setSearchActivitiesBy(String searchString) {
    sortingOptions.optionNotifier.value = SearchAndSortOptions(
        searchString, sortingOptions.optionNotifier.value.sortOption);
  }

  static var searchString = '';

  // COLOR SCHEMA
  static final colorsByMood = {
    'anxious': AppColors.cyan,
    'sleepless': AppColors.red,
    'energetic': AppColors.orange,
    'other': AppColors.green
  };

  static final gradsByMood = {
    'anxious': AppGrads.purple,
    'sleepless': AppGrads.sunset,
    'energetic': AppGrads.orange,
    'other': AppGrads.green
  };

  static Color getColorByMood(String mood) {
    var color = colorsByMood[mood.toLowerCase()];
    return color ?? const Color(0x0);
  }

  static LinearGradient getGradByMood(String mood) {
    LinearGradient grad;

    switch (mood.toLowerCase()) {
      case 'anxious':
        return AppGrads.purple;
      case 'sleepless':
        return AppGrads.sunset;
      case 'energetic':
        return AppGrads.orange;
      case 'other':
        return AppGrads.green;
      default:
        return AppGrads.blue;
    }

    // return grad;
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

  //can get any needed gradient
  static getGradByName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return AppGrads.blue;
      case 'purple':
        return AppGrads.purple;
      case 'orange':
        return AppGrads.orange;
      case 'green':
        return AppGrads.green;
      case 'orange':
        return AppGrads.orange;
      case 'distractingcontact':
        return AppGrads.phoneContact1;
      case 'helpingcontact':
        return AppGrads.phoneContact2;
      case 'professionalcontact':
        return AppGrads.phoneContact3;
      case 'maingreen':
        return AppGrads.mainGreen;
      default:
        return 'orange';
    }
  }
}

// COLOR CONSTANTS
class AppColors {
  static const cyan = Color(0xff8CC9BA);
  static const red = Color(0xffFC8D7A);
  static const orange = Color(0xffF9CB9A);
  static const green = Color(0xffC5D7BF);
  static const black = Color.fromRGBO(76, 68, 77, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const red2 = Color.fromRGBO(230, 81, 86, 1);
  static const grey = Color.fromRGBO(90, 90, 90, 1);
  static const bg = Color.fromRGBO(252, 245, 235, 1);
  static const font = Color.fromRGBO(81, 69, 106, 1);
}

class AppGrads {
  static const LinearGradient blue = LinearGradient(
    colors: [
      Color.fromRGBO(127, 197, 237, 1),
      Color.fromRGBO(185, 255, 173, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient purple = LinearGradient(
    colors: [
      Color.fromRGBO(130, 165, 255, 1),
      Color.fromRGBO(255, 130, 227, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient green = LinearGradient(
    colors: [
      Color.fromRGBO(149, 240, 141, 1),
      Color.fromRGBO(192, 249, 119, 1),
      Color.fromRGBO(255, 232, 174, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient orange = LinearGradient(
    colors: [
      Color.fromRGBO(255, 184, 119, 1),
      Color.fromRGBO(255, 235, 163, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient sunset = LinearGradient(
    colors: [
      Color.fromRGBO(219, 142, 211, 1),
      Color.fromRGBO(255, 125, 153, 1),
      Color.fromRGBO(255, 169, 132, 1),
      Color.fromRGBO(255, 225, 147, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Series of Gradients used for phone contacts
  static const LinearGradient phoneContact1 = LinearGradient(colors: [
    Color.fromRGBO(255, 234, 202, 1),
    Color.fromRGBO(255, 180, 180, 1),
    Color.fromRGBO(234, 142, 242, 1),
    Color.fromRGBO(162, 171, 247, 1),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const LinearGradient phoneContact2 = LinearGradient(colors: [
    Color.fromRGBO(255, 250, 131, 1),
    Color.fromRGBO(201, 242, 149, 1),
    Color.fromRGBO(82, 238, 145, 1),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const LinearGradient phoneContact3 = LinearGradient(colors: [
    Color.fromRGBO(255, 234, 202, 1),
    Color.fromRGBO(255, 180, 180, 1),
    Color.fromRGBO(234, 142, 242, 1),
    Color.fromRGBO(162, 171, 247, 1),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  //Gradient for main green color (used for confirm)
  static const LinearGradient mainGreen = LinearGradient(colors: [
    Color.fromRGBO(190, 255, 204, 1),
    Color.fromRGBO(129, 212, 188, 1),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  //series of gradients used for lichert scale
  static const LinearGradient lowest = LinearGradient(colors: [
    Color.fromRGBO(231, 99, 83, 1),
    Color.fromRGBO(239, 149, 99, 1),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const LinearGradient secondLowest = LinearGradient(colors: [
    Color.fromRGBO(239, 149, 99, 1),
    Color.fromRGBO(246, 146, 199, 1),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const LinearGradient medium = LinearGradient(colors: [
    Color.fromRGBO(246, 146, 199, 1),
    Color.fromRGBO(176, 187, 225, 1),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const LinearGradient secondHighest = LinearGradient(colors: [
    Color.fromRGBO(176, 187, 225, 1),
    Color.fromRGBO(135, 227, 226, 1),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const LinearGradient highest = LinearGradient(colors: [
    Color.fromRGBO(135, 227, 226, 1),
    Color.fromRGBO(170, 255, 130, 1),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}

// SORTING UTILS
class ActivitiesSorting with ChangeNotifier {
  ValueNotifier<SearchAndSortOptions> optionNotifier =
      ValueNotifier<SearchAndSortOptions>(
          SearchAndSortOptions('', SortOptions.NONE));
}

enum SortOptions { NONE, FAVORITE, MOOD, TIME, RATING }

enum Moods { ANXIOUS, SLEEPLESS, ENERGETIC, OTHER }

extension ParseToString on Moods {
  String toShortString() {
    var lower = toString().toLowerCase();
    return lower[6].toUpperCase() + lower.substring(7);
  }
}

class SearchAndSortOptions {
  String searchString;
  SortOptions sortOption;

  SearchAndSortOptions(this.searchString, this.sortOption);
}