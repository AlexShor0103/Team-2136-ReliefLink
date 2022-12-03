import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';


// Widget reliefDropDown(String label, String placeholder) {
//   return DropdownButton
// }
Widget reliefTextInput(String label, String placeholder) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(
            height: 0,
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.w900,
            fontSize: 17,
          )),
      TextField(
        onChanged: (value) => {placeholder = value},
        style: const TextStyle(
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.w600,
            fontSize: 18),
        decoration: InputDecoration(
          isDense: true,
          hintText: placeholder,
        ),
      ),
    ]),
  );
}

showReliefEditDialogue(BuildContext context) {
  Widget remindButton = TextButton(
    child: Text("Remind me Later"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
      title: Text("Test"),
      content: Text("edit features"),
      actions: [reliefTextInput("hello", "hello"), reliefTextInput("hello", "hello"), remindButton]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
// DropdownButton(
//   items: activities.map((e) {
//     return DropdownMenuItem(child: 
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(e.activityName),
//         Container(
//           height: 10,
//           width: 10,
//           decoration: ShapeDecoration(
//             shape: CircleBorder(),
//             gradient: AppConstants.getGradByMood(e.mood),
//           ),
//         )
//       ]
//     ),
//     value: e);
//   }).toList(),
//   onChanged: (val) {},
// )
