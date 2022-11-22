import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivitiesMenu/SearchContainer.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';

import '../components/ReliefActivitiesMenu/ActivitiesContainer.dart';
import '../components/ReliefActivitiesMenu/SortContainer.dart';
import '../utils/data_storage.dart';

class ReliefHomeScreen extends StatefulWidget {
  const ReliefHomeScreen({Key? key}) : super(key: key);

  @override
  State<ReliefHomeScreen> createState() => _ReliefHomeScreenState();
}

class _ReliefHomeScreenState extends State<ReliefHomeScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  Moods mood = Moods.OTHER;
  int duration = 0;
  String URL = '';

  // Used to update the widget after the new creation of a card
  // Feel free to change this if you find another way
  ValueKey key = ValueKey(Random().nextInt(100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.bg,
          child: ListView(children: <Widget>[
            const SearchContainer(),
            SortContainer(),
            ReliefActivityBoxContainer(key: key),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Container(
            child: const Padding(
              padding: EdgeInsets.all(13.0),
              child: Icon(
                Icons.add,
                color: AppColors.black,
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppConstants.getGradByName('maingreen')),
          ),
          onPressed: () async => {
                await DataStorage.init(),
                showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: const [
                            BackButton(),
                            Text('Add new Relief Technique',
                                style: TextStyle(
                                  color: AppColors.font,
                                  fontFamily: 'MainFont',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                        content: SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    initialValue: name,
                                    style: const TextStyle(
                                      color: AppColors.font,
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                        hintText:
                                            'Enter the name of the Relief Activity',
                                        labelText: 'Name',
                                        labelStyle: TextStyle(
                                          color: AppColors.font,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        )),
                                    onSaved: (String? value) {
                                      name = value ?? 'Activity\'s name';
                                    },
                                  ),
                                  DropdownButtonFormField(
                                    items: Moods.values
                                        .map((a) => DropdownMenuItem(
                                              child: Text(a.toShortString()),
                                              value: a,
                                            ))
                                        .toList(),
                                    style: const TextStyle(
                                      color: AppColors.font,
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                        hintText:
                                            'Enter the mood for this activity',
                                        labelText: 'Activity`s mood',
                                        labelStyle: TextStyle(
                                          color: AppColors.font,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        )),
                                    onChanged: (Moods? value) {
                                      mood = value ?? Moods.OTHER;
                                    },
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    initialValue: duration.toString(),
                                    style: const TextStyle(
                                      color: AppColors.font,
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                        hintText:
                                            'Enter the duration of the Activity',
                                        labelText: 'Duration',
                                        labelStyle: TextStyle(
                                          color: AppColors.font,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        )),
                                    onSaved: (String? value) {
                                      duration = int.parse(value ?? '0');
                                    },
                                  ),
                                  TextFormField(
                                    initialValue: URL,
                                    style: const TextStyle(
                                      color: AppColors.font,
                                      fontFamily: 'MainFont',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                        hintText:
                                            'Enter the URL of the video of the Activity',
                                        labelText: 'URL',
                                        labelStyle: TextStyle(
                                          color: AppColors.font,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        )),
                                    onSaved: (String? value) {
                                      URL = value ?? 'Activity\'s URL';
                                    },
                                  ),
                                ],
                              )),
                        )),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () async {
                              _formKey.currentState!.save();
                              if (name != '' && URL != '' && duration > 0) {
                                await DataStorage.init();
                                DataStorage.updateReliefTechniqueData(
                                    ReliefTechniqueData(
                                        activityName: name,
                                        mood:
                                            mood.toShortString().toLowerCase(),
                                        videoLink: URL,
                                        duration: duration,
                                        favorite: false));
                                DataStorage.saveToDisk();
                                name = '';
                                mood = Moods.OTHER;
                                duration = 0;
                                URL = '';
                              }
                              setState(() {
                                key = ValueKey(Random().nextInt(100));
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    })
              }),

    );

  }
}
