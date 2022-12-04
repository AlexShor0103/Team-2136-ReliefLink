import 'dart:html';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';

class ReliefTextDropdown extends StatefulWidget {
  final String label;
  final String curVal;
  final Function(String val) setFunc;
  const ReliefTextDropdown({
    Key? key,
    required this.label,
    required this.curVal,
    required this.setFunc,
  }) : super(key: key);

  @override
  _ReliefTextDropdownState createState() => _ReliefTextDropdownState();
}

class _ReliefTextDropdownState extends State<ReliefTextDropdown> {
  String dropdownval = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownval = widget.curVal;
  }

  List names = activities
      .map(
        (e) => (e.activityName),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    print("building begun. ddv is: ${dropdownval}");
    if (!names.contains(dropdownval)) {
      print("oops");
      dropdownval = "Walking";
    }
    print("after checking, dropdownvalfr becomes: ${dropdownval}");

    return DropdownButton<String>(
        value: dropdownval,
        items: activities.map((e) {
          return DropdownMenuItem(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.activityName),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        gradient: AppConstants.getGradByMood(e.mood),
                      ),
                    )
                  ]),
              value: e.activityName);
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownval = value!;
          });
          widget.setFunc(dropdownval);
        });
  }
}

Widget reliefButton(String placeholder) {
  List names = activities
      .map(
        (e) => (e.activityName),
      )
      .toList();
  if (!names.contains(placeholder)) {
    return Container(
      width: double.maxFinite,
      color: AppColors.black.withOpacity(0.5),
      child: Text("No Relief Technique Selected"),
    );
  }

  return Text(placeholder);
}

Widget reliefInput(String label, String placeholder) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: const TextStyle(
              height: 0,
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w900,
              fontSize: 17,
            )),
        reliefButton(placeholder)
      ]));
}

// Widget distractingContactsInput(String label, String placeholder) {
//     return Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text(label,
          //     style: const TextStyle(
          //       height: 0,
          //       color: AppColors.font,
          //       fontFamily: 'MainFont',
          //       fontWeight: FontWeight.w900,
          //       fontSize: 17,
          //     )),
//           TextField(
//             onChanged: (value) => {
//               if (label == "Distracting Contact 1:")
//                 {firstDistractingContact = value}
//               else if (label == "Distracting Contact 2:")
//                 {secondDistractingContact = value}
//               else if (label == "Distracting Place")
//                 {distractingPlace = value}
//             },
//             style: const TextStyle(
//                 color: AppColors.font,
//                 fontFamily: 'MainFont',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 18),
//             decoration: InputDecoration(
//               isDense: true,
//               hintText: placeholder,
//             ),
//           )
//         ]));
//   }