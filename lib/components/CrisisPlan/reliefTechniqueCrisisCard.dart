import 'dart:html';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';

class ReliefTextDropdown extends StatefulWidget {
  final String label;
  String placeholder;
  ReliefTextDropdown({Key? key, required this.label, required this.placeholder})
      : super(key: key);

  @override
  _ReliefTextDropdownState createState() => _ReliefTextDropdownState();
}

class _ReliefTextDropdownState extends State<ReliefTextDropdown> {
  String dropdownval = "";
  List names = activities
      .map(
        (e) => (e.activityName),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    if (!names.contains(widget.placeholder)) {
      print("oops");
      widget.placeholder = "Walking";
      print("${widget.placeholder}");
    }
    dropdownval = widget.placeholder;
    print("$dropdownval");
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
            widget.placeholder = value!;
            dropdownval = widget.placeholder;
            debugPrint("placeholder is now: ${widget.placeholder}");
          });
        });
  }
}

Widget reliefTextDropdown(String label, String placeholder) {
  placeholder = "Walking";

  return DropdownButton<String>(
      value: placeholder,
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
        placeholder = value!;
        debugPrint("placeholder is now: ${placeholder}");
      });
}

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


