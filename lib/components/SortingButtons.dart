

import 'package:flutter/material.dart';
import './SortContainer.dart';
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

  SortOptions option;
  final String text;

  ReliefTechniqueSortingButtonState(this.text, this.option);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RadioListTile<SortOptions>(
                    title: Text(text),
                    value:  this.option,
                    
                    groupValue: SortContainerState.optionState,
                    onChanged: (SortOptions? value) {
                      setState(() {
                        SortContainerState.optionState = value!;
                      });
                    }
    );
  }

  
}