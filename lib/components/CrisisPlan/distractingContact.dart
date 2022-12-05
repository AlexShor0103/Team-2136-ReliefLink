import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';


class DistractingContactDropdown extends StatefulWidget {
  final String label;
  final String curVal;
  final Function(String val) setFunc;
  const DistractingContactDropdown({
    Key? key,
    required this.label,
    required this.curVal,
    required this.setFunc,
  }) : super(key: key);

  @override
  _DistractingContactDropdownState createState() => _DistractingContactDropdownState();
}

class _DistractingContactDropdownState extends State<DistractingContactDropdown> {
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
      dropdownval = "Muscle Relaxation";
    }
    print("after checking, dropdownvalfr becomes: ${dropdownval}");

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(widget.label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              height: 0,
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w900,
              fontSize: 17,
            )),
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
