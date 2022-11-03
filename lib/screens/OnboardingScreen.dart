import 'package:flutter/material.dart';
import 'package:relieflink/screens/ContactsScreen.dart';
import 'package:relieflink/screens/DemonstrationScreen.dart';
import 'package:relieflink/screens/MapScreen.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'package:relieflink/screens/ReliefHomeScreen.dart';

import '../components/Navigation/TopBars.dart';
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Welcome to ReliefLink!'),
                const Text('We are here to help you.'),
                const Text(
                    'Let`s start with a few questions to get you know better, how does that sound?.'),
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
                                                                            MaterialPageRoute(builder: (context) => Scaffold(appBar: const Top_Relief(), body: SafeArea(child: Nav()))));
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
                    label: const Text('Let`s do it!')),
                GestureDetector(
                  onTap: () {
                    print('SKIP');
                  },
                  child: const Text("Skip"),
                ),
              ]),
        ),
      ),
    );
  }
}
