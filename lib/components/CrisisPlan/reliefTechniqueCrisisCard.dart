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
/*
/ we don't want any change to p1 to be permanent yet. that's for confirm. Instead
we have t1 (temporaryString1).

the Dropdown call will go
ReliefTextDropdown(label: "Relief Technique 1: ", curVal: p1, function that sets c1 to dropdownval)

in ReliefTextDropdown, inside of onChanged, call function with dropdownval as parameter

in dialogue, pass into dropdown curValue and function (value) => {p1 = value}
*/

// Widget reliefTextContainer(String containingString, ReliefTextDropdown rfd) {
//   return 
// }
// Widget reliefTextDropdown(String label, String placeholder) {
//   placeholder = "Walking";

//   return DropdownButton<String>(
//       value: placeholder,
//       items: activities.map((e) {
//         return DropdownMenuItem(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(e.activityName),
//                   Container(
//                     height: 15,
//                     width: 15,
//                     decoration: ShapeDecoration(
//                       shape: CircleBorder(),
//                       gradient: AppConstants.getGradByMood(e.mood),
//                     ),
//                   )
//                 ]),
//             value: e.activityName);
//       }).toList(),
//       onChanged: (String? value) {
//         placeholder = value!;
//         debugPrint("placeholder is now: ${placeholder}");
//       });
// }

// Widget reliefTextInput(String label, String placeholder) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 20, right: 20),
//     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(label,
//           style: const TextStyle(
//             height: 0,
//             color: AppColors.font,
//             fontFamily: 'MainFont',
//             fontWeight: FontWeight.w900,
//             fontSize: 17,
//           )),
//       TextField(
//         onChanged: (value) => {placeholder = value},
//         style: const TextStyle(
//             color: AppColors.font,
//             fontFamily: 'MainFont',
//             fontWeight: FontWeight.w600,
//             fontSize: 18),
//         decoration: InputDecoration(
//           isDense: true,
//           hintText: placeholder,
//         ),
//       ),
//     ]),
//   );
// }


// DropdownButton(
//   items: activities.map((e) {
//     return DropdownMenuItem(child: 
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(e.activityName),
        // Container(
        //   height: 10,
        //   width: 10,
        //   decoration: ShapeDecoration(
        //     shape: CircleBorder(),
        //     gradient: AppConstants.getGradByMood(e.mood),
        //   ),
        // )
//       ]
//     ),
//     value: e);
//   }).toList(),
//   onChanged: (val) {},
// )


