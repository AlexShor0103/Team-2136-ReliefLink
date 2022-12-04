import 'package:flutter/material.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:relieflink/screens/DiaryScreen.dart';
import 'package:relieflink/screens/ContactsScreen.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'ReliefHomeScreen.dart';
import 'package:relieflink/screens/CrisisPlanScreen.dart';

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
    const CrisisPlan(),
    const ReliefHomeScreen(),
    MeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var appBar;
    switch (currentIndex) {
      case 0:
        appBar = TOP_BARS.DIARY;
        break;
      case 1:
        appBar = TOP_BARS.CONTACTS;
        break;
      case 2:
        appBar = TOP_BARS.CRISIS;
        break;
      case 3:
        appBar = TOP_BARS.RELIEF_MAIN;
        break;
      case 4:
        appBar = TOP_BARS.ME;
        break;
      default:
    }

    return Scaffold(
        appBar: appBar,
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.bg,
            boxShadow: [
              BoxShadow(
                color: AppColors.font.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SizedBox(
              
              height: 105,
              child: BottomNavigationBar(
                backgroundColor: AppColors.bg,
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
                selectedItemColor: AppColors.black,
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
                      Icons.local_florist,
                    ),
                    label: 'Plan',
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
