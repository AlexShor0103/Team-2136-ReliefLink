import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

class WarningSignAuto extends StatelessWidget {
  const WarningSignAuto({Key? key}) : super(key: key);

  static const List<String> _warningSignOptions = <String>[
    'sleeplessness',
    'mood swings',
    'extreme anger',
    'increased substance abuse',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == '') {
        return const Iterable<String>.empty();
      }
      return _warningSignOptions.where((String option) {
        return option.contains(textEditingValue.text.toLowerCase());
      });
    }, onSelected: (String selection) {
      debugPrint('You just selected $selection');
    });
  }
}

Widget warningTextInputAuto(String label, String placeholder) {
  const List<String> _warningSignOptions = <String>[
    'sleeplessness',
    'mood swings',
    'extreme anger',
    'increased substance abuse',
  ];

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
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _warningSignOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }, onSelected: (String selection) {
          debugPrint('You just selected $selection');
        }),
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
