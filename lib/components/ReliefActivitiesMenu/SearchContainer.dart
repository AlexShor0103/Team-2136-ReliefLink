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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Color.fromRGBO(0, 0, 0, 0),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 13,
          )
        ],
      ),
      child: TextField(
        onChanged: (text) {
          AppConstants.searchString = text;
          AppConstants.setSearchActivitiesBy(text);
        },
        style: const TextStyle(
          color: AppColors.font,
          fontFamily: 'MainFont',
          fontSize: 17,
        ),
        decoration: const InputDecoration(
          isDense: true,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          hintText: 'Search For an Activity',
          hintStyle: const TextStyle(
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontSize: 17,
          ),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
