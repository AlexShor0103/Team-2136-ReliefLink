import 'package:flutter/material.dart';

import 'components/ActivitiesContainer.dart';
import 'components/SortContainer.dart';

class ReliefHomeScreen extends StatelessWidget {
  const ReliefHomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
          SortContainer(), 
          SingleChildScrollView(child: ReliefActivityBoxContainer())]),
    );
  }
}