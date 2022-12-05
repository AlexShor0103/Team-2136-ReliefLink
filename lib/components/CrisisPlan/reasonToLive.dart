import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/activities/activities.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';

Widget reasonInput(String placeholder) {
  return Padding(padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (value) => {placeholder = value},
          style: const TextStyle(
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.w600,
            fontSize: 16
          ),
          minLines: 1,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: placeholder,
            fillColor: AppColors.black.withOpacity(0.1),
          ),
        )
      ]
    )
  );
}