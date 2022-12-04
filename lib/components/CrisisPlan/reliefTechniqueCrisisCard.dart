import 'dart:html';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';

/*
double checking this works
*/
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.label,
          textAlign: TextAlign.start,
          style: const TextStyle(
            height: 0,
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.w900,
            fontSize: 17,
          )
        ),
        DropdownButton<String>(
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
      })
      ],
    );
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
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "No Relief Technique Selected",
                style: const TextStyle(
                    color: AppColors.font,
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
        ));
  }
  ReliefTechniqueData activity = activities.firstWhere(
      (e) => e.activityName.toLowerCase().contains(placeholder.toLowerCase()));
  return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: AppConstants.getGradByMood(activity.mood),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              color: AppColors.black.withOpacity(0.25),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              activity.activityName,
              style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
      ));
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

/*
return Container(
  decoration: BoxDecoration(
    gradient: AppGrads.mainGreen,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReliefRateScreen(data: data)));
      },
      child: const Text("Mark As Completed",
        style: TextStyle(
          color: AppColors.font,
          fontFamily: 'MainFont',
          fontWeight: FontWeight.w800,
          fontSize: 20,
        )),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      )
    ),
  ) 
);
*/