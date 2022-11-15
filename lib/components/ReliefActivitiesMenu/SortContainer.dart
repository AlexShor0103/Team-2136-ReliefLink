import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

class SortContainer extends StatefulWidget {
  SortOptions? option;

  @override
  State<StatefulWidget> createState() {
    return SortContainerState();
  }
}

class SortContainerState extends State<SortContainer> {
  static SortOptions? optionState = SortOptions.NONE;
  @override
  Widget build(BuildContext context) {
    void setNewSort(SortOptions option) {
      setState(() {
        optionState = option;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Row(
        children: [
          const Text('Sort By',
            style: const TextStyle(
              color: AppColors.black,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          SizedBox(
            child: DropdownButton<SortOptions>(
                value: optionState,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  color: AppColors.black,
                  fontFamily: 'MainFont',
                  fontSize: 17,
                ),
                underline: Container(
                  height: 2,
                  color: AppColors.black,
                ),
                onChanged: (SortOptions? value) {
                  // This is called when the user selects an item.
                  setNewSort(value ?? SortOptions.NONE);
                  AppConstants.setSortActivitiesBy(value ?? SortOptions.NONE);
                },
                items: const [
                  DropdownMenuItem<SortOptions>(
                    value: SortOptions.NONE,
                    child: Text('None'),
                  ),
                  DropdownMenuItem<SortOptions>(
                    value: SortOptions.FAVORITE,
                    child: Text('Favorite'),
                  ),
                  DropdownMenuItem<SortOptions>(
                      value: SortOptions.RATING,
                      child: Text('Rating')
                  ),
                  DropdownMenuItem<SortOptions>(
                    value: SortOptions.MOOD,
                    child: Text('Mood'),
                  ),
                  DropdownMenuItem<SortOptions>(
                    value: SortOptions.TIME,
                    child: Text('Time Taken'),
                  )
                ]),
          ),
        ],
      ),
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
