import 'package:flutter/material.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:relieflink/screens/DiaryScreen.dart';
import 'package:relieflink/screens/ContactsScreen.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/screens/MeScreen.dart';
import 'ReliefHomeScreen.dart';
import 'package:relieflink/screens/CrisisPlan.dart';

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
    const CrisisPlan(),
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
        appBar = TOP_BARS.RELIEF_MAIN;
        break;
      case 3:
        appBar = TOP_BARS.ME;
        break;
      case 4:
        appBar = TOP_BARS.CRISIS;
        break;
      default:
    }

    return Scaffold(
        //state within screens are maintained
        appBar: appBar,
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          child: const Icon(Icons
              .local_florist), //icon ideas: balance cloud crisis_alert emergency_sharp foggy front_hand handshake healing health_and_safety
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CrisisPlan()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
