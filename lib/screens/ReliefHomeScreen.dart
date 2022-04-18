import 'package:flutter/material.dart';

import '../components/ReliefActivitiesMenu/ActivitiesContainer.dart';
import '../components/ReliefActivitiesMenu/SortContainer.dart';

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