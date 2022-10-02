import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        AppConstants.searchString = text;
        AppConstants.setSearchActivitiesBy(text);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search for an Activity',
      ),
    );
  }
}
