import 'package:flutter/material.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:relieflink/screens/ReliefHomeScreen.dart';

import '../utils/constants.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 600, right: 12),
              alignment: Alignment.bottomRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => showAlertDialog(context),
                      );
                    },
                    backgroundColor: Colors.blueAccent,
                    child: const Icon(Icons.add_outlined, size: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
  AlertDialog showAlertDialog(BuildContext context) {
    return AlertDialog(
        title: const Text("Journal"),
        content: const Text("How are you feeling today?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Continue"),
            onPressed: () {},
          ),
        ]
    );
  }
}