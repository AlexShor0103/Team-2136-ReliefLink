import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/utils/data_storage.dart';

import '../components/Navigation/TopBars.dart';

class DemonstrationScreen extends StatelessWidget {
  final Widget originalScreen;
  final String message;
  final Function() function;
  const DemonstrationScreen(
      {Key? key,
      required this.originalScreen,
      required this.message,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        IgnorePointer(
          child: Scaffold(appBar: TOP_BARS.ONBOARDING, body: originalScreen),
        ),
        Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Container(color: Color.fromRGBO(0, 0, 0, 0.8)),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: AppConstants.gradsByMood['sleepless']),
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColors.white),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    function();
                                    print('Next');
                                  },
                                  icon: Icon(
                                    Icons.navigate_next_rounded,
                                    color: AppColors.white,
                                  )),
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}
