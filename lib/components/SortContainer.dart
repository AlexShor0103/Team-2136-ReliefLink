import 'package:flutter/material.dart';

enum SortOptions {

  FAVORITE,
  MOOD,
  TIME
}
class SortContainer extends StatefulWidget {
  static SortOptions? option;
  


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SortContainerState();
  }
}
class SortContainerState extends State<SortContainer>{
  SortOptions? optionState;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      children: [
        ReliefTechniqueSortingButton(text:  "Sort by Favorite", option: SortOptions.FAVORITE, optionState: optionState), 
        
          Column( children:[
            ReliefTechniqueSortingButton(text:  "Sort by Mood", option: SortOptions.MOOD , optionState: optionState),
            ReliefTechniqueSortingButton(text:  "Sort by Time Taken", option: SortOptions.TIME, optionState: optionState)//Row
                ])
        ],
    );
  }

}
class ReliefTechniqueSortingButton extends StatefulWidget {
  final String text; 
  final SortOptions option;
  SortOptions? optionState;
  ReliefTechniqueSortingButton({Key? key, required this.text, required this.option, required this.optionState}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReliefTechniqueSortingButtonState(this.text, option, optionState);
  }

}
class ReliefTechniqueSortingButtonState extends State<ReliefTechniqueSortingButton> {

  final SortOptions option;
  final String text;
  SortOptions ?groupoption;
  SortOptions? sortState;
  ReliefTechniqueSortingButtonState(this.text, this.option, this.sortState);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RadioListTile<SortOptions>(
                    title: Text(text),
                    value:  option,
                    toggleable: true,
                    groupValue: sortState,
                    onChanged: (SortOptions? value) {
                      setState(() {
                        if (sortState == value) {
                          sortState = null;
                        } else {
                            sortState = value;
                        }

                        
                        
                      });
                    }
    );
  }
  
  
}
