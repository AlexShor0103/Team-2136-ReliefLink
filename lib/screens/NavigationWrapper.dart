import 'package:flutter/material.dart';
import 'package:relieflink/recommendations/RecommendationScreen.dart';
import 'package:relieflink/screens/DiaryScreen.dart';
import 'package:relieflink/screens/ContactsScreen.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'ReliefHomeScreen.dart';
import '../components/Profile/ProfileScreen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  //currentIndex: selected screen(icon) index
  //start from relief screen (2)
  int currentIndex = 2;
  final screens = [
    const DiaryScreen(),
    const ContactsScreen(),
    const ReliefHomeScreen(),
    MeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //state within screens are maintained
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.font.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
              height: 100,
              child: BottomNavigationBar(
                //currentIndex: selected screen(icon) index
                currentIndex: currentIndex,
                onTap: (index) => setState(
                  () => currentIndex = index,
                ),
                type: BottomNavigationBarType.fixed,
                iconSize: 35,
                selectedFontSize: 15,
                unselectedFontSize: 15,
                unselectedItemColor: AppColors.grey.withOpacity(0.6),
                selectedItemColor: AppColors.font,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark_outline,
                    ),
                    label: 'Diary',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.phone_outlined,
                    ),
                    label: 'Contacts',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.air,
                    ),
                    label: 'Relief',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle_outlined,
                    ),
                    label: 'Me',
                  ),
                ],
              )),
        ));
  }
}