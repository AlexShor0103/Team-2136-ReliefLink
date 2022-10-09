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
          BoxShadow(color: AppColors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
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

    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    //   child: Container(
    //       decoration: BoxDecoration(boxShadow: [
    //         BoxShadow(),
    //       ]),
    //       child: TextField(
    //           onChanged: (text) {
    //             AppConstants.searchString = text;
    //             AppConstants.setSearchActivitiesBy(text);
    //           },
    //           style: const TextStyle(
    //             color: AppColors.font,
    //             fontFamily: 'MainFont',
    //             fontSize: 17,
    //           ),
    //           decoration: const InputDecoration(
    //             // contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),

    //             filled: true,
    //             fillColor: AppColors.white,
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(100)),
    //               borderSide: BorderSide.none,
    //             ),
    //             prefixIcon: Icon(Icons.search),
    //             prefixIconColor: AppColors.font,
    //             hintText: 'Search for an Activity',
    //             hintStyle: const TextStyle(
    //               color: AppColors.font,
    //               fontFamily: 'MainFont',
    //               fontSize: 17,
    //             ),
    //           ))),
    // );
  }
}
