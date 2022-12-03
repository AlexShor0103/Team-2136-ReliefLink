import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

Widget warningTextInputAuto(String label, String placeholder) {
  const List<String> _warningSignOptions = <String>[
    'sleeplessness',
    'mood swings',
    'extreme anger',
    'substance abuse',
    'self-injury',
    'paranoia',
    'suicidal ideation',
    'hallucinations',
    'delusions',
    'not being able to do daily tasks'
  ];

  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //label text
        Text(label,
            style: const TextStyle(
              height: 0,
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w900,
              fontSize: 17,
            )),
        //search bar
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _warningSignOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            placeholder = selection;
            debugPrint('You just selected $selection');
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              controller: textEditingController,
              focusNode: focusNode,
              onEditingComplete: onFieldSubmitted,
              decoration: InputDecoration(hintText: placeholder, isDense: true),
            );
          },
        ),
      ]));
}

Widget warningTextInput(String label, String placeholder) {
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
        )
      ]));
}
