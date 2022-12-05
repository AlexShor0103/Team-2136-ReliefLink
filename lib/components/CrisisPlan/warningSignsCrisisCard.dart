import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

Widget warningTextInputAuto(String label, String placeholder) {
  const List<String> _warningSignOptions = <String>[
    'Sleeplessness',
    'Mood swings',
    'Extreme anger',
    'Substance abuse',
    'Self-injury',
    'Paranoia',
    'Suicidal ideation',
    'Hallucinations',
    'Delusions',
    'Not being able to do daily tasks'
  ];

  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //label text
        Text(label,
            style: const TextStyle(
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
              return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            placeholder = selection;
            debugPrint('You just selected $selection');
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
                alignment: Alignment.topLeft,
                child: Material(
                    child: Container(
                  decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: AppColors.black.withOpacity(0.3),
                        offset: const Offset(0, 4))
                  ]),
                  width: 330,
                  constraints: BoxConstraints.tightForFinite(width: 303, height: options.length * 76),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                              title: Text(
                            option,
                            style: const TextStyle(
                                color: AppColors.font,
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                        );
                      }),
                )));
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
