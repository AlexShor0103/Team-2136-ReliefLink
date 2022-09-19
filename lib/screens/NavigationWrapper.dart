import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

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
  //TODO: These 'Centers' are going to be replaced with actual screens.
  final screens = [
    //diaryScreen()
    //contactScreen()
    //reliefScreen()
    //meScreen()
    Center(
      child: Text(
        'Diary',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'Contact',
        style: TextStyle(fontSize: 60),
      ),
    ),
    ReliefHomeScreen(),
    ProfileScreen(),
    // Center(
    //   child: Text(
    //     'Me',
    //     style: TextStyle(fontSize: 60),
    //   ),
    // )
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
                color: Colors.black.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
              height: 70,
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
                unselectedItemColor: AppColors.grey,
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
                    label: 'Contact',
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
