import 'package:flutter/material.dart';
import 'package:relieflink/screens/ContactsScreen.dart';
import 'package:relieflink/screens/DemonstrationScreen.dart';
import 'package:relieflink/screens/MapScreen.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:relieflink/screens/ReliefHomeScreen.dart';

import '../components/Navigation/TopBars.dart';
import '../utils/constants.dart';
import 'NavigationWrapper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to ReliefLink!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: AppColors.black),
                  ),
                  const Text(
                    'We are here to help you.',
                    style: TextStyle(fontSize: 19, color: AppColors.black),
                  ),
                  const Text(
                      'Let`s start with a few questions to get you know better, how does that sound?.',
                      style: TextStyle(fontSize: 16, color: AppColors.black)),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DemonstrationScreen(
                                  function: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DemonstrationScreen(
                                                    function: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DemonstrationScreen(
                                                                      function:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => Scaffold(appBar: TOP_BARS.ONBOARDING, body: SafeArea(child: Nav()))));
                                                                      },
                                                                      originalScreen:
                                                                          MeScreen(),
                                                                      message:
                                                                          'This is the Me screen. Here you find your settings, some app recommendations and the map screen!')));
                                                    },
                                                    originalScreen:
                                                        ContactsScreen(),
                                                    message:
                                                        'This is the contacts screen. Here you add and find your emergency contacts!')));
                                  },
                                  originalScreen: ReliefHomeScreen(),
                                  message:
                                      'This is the main screen. Here you find information on relief techniques.')));
                    },
                    icon: const Icon(Icons.start_outlined),
                    label: const Text('Let`s do it!'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(AppColors.cyan),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(
                                    appBar: TOP_BARS.ONBOARDING,
                                    body: SafeArea(child: Nav()))));
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: AppColors.grey),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
