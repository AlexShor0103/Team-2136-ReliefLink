import 'package:flutter/material.dart';

enum SortOptions {
  NONE,
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
  static SortOptions? optionState;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      children: [
        ReliefTechniqueSortingButton(text:  "Sort by Favorite", option: SortOptions.FAVORITE), 
        
          Column( children:[
            ReliefTechniqueSortingButton(text:  "Sort by Mood", option: SortOptions.MOOD),
            ReliefTechniqueSortingButton(text:  "Sort by Time Taken", option: SortOptions.TIME)//Row
                ])
        ],
    );
  }

}
class ReliefTechniqueSortingButton extends StatefulWidget {
  final String text; 
  final SortOptions option;

  const ReliefTechniqueSortingButton({Key? key, required this.text, required this.option}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReliefTechniqueSortingButtonState(this.text, this.option);
  }

}
class ReliefTechniqueSortingButtonState extends State<ReliefTechniqueSortingButton> {

  final SortOptions option;
  final String text;
  SortOptions ?groupoption;
  ReliefTechniqueSortingButtonState(this.text, this.option);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RadioListTile<SortOptions>(
                    title: Text(text),
                    value:  this.option,
                    
                    groupValue: groupoption,
                    onChanged: (SortOptions? value) {
                      setState(() {
                        groupoption = value!;
                        print(SortContainerState.optionState);
                      });
                    }
    );
  }
  
  
}
