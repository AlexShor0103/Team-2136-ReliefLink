import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

class SortContainer extends StatefulWidget {
  SortOptions? option;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SortContainerState();
  }
}

class SortContainerState extends State<SortContainer> {
  SortOptions? optionState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void setNewSort(SortOptions option) {
      setState(() {
        optionState = option;
      });
    }

    return Column(
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      children: [
        SortingButton(
          text: "Sort by Favorite",
          option: SortOptions.FAVORITE,
          groupOption: optionState ?? SortOptions.NONE,
          callback: setNewSort,
        ),
        SortingButton(
          text: "Sort by Mood",
          option: SortOptions.MOOD,
          groupOption: optionState ?? SortOptions.NONE,
          callback: setNewSort,
        ),
        SortingButton(
          text: "Sort by Time Taken",
          option: SortOptions.TIME,
          groupOption: optionState ?? SortOptions.NONE,
          callback: setNewSort,
        )
      ],
    );
  }
}

class SortingButton extends StatelessWidget {
  final String text;
  final SortOptions option;
  final SortOptions groupOption;
  final void Function(SortOptions) callback;
  const SortingButton(
      {Key? key,
      required this.option,
      required this.text,
      required this.groupOption,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<SortOptions>(
        title: Text(text),
        value: option,
        groupValue: groupOption,
        onChanged: (SortOptions? value) {
          callback(value ?? SortOptions.NONE);
          AppConstants.setSortActivitiesBy(value ?? SortOptions.NONE);
        });
  }
}
