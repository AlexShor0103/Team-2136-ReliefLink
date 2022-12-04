import 'package:flutter/material.dart';
import 'package:relieflink/components/EmergencyContact.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/utils/data_storage.dart';
import 'package:relieflink/utils/emergency_contact_utils.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late List<String> list;
  late List<Widget> cardsList;

  void updateHere() {
    setState(() {
      list = DataStorage.getValue('applist_contacts');
      if (list.contains('')) {
        list.remove('');
      }
      cardsList = list.map((element) {
        return EmergencyContact(
          contactIdPassed: element,
          update: updateHere,
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    list = DataStorage.getValue('applist_contacts') ?? [];

    if (list.isEmpty) {
      DataStorage.init().then((value) => {
            list = DataStorage.getValue('applist_contacts') ?? [],
            updateHere()
          });
    }

    cardsList = list.map((element) {
      return EmergencyContact(
        contactIdPassed: element,
        update: updateHere,
      );
    }).toList();

    if (cardsList.isEmpty) {
      cardsList = [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'Here you can add your emergency contacts. Those are people who can help you when you need it the most! They will be 2 clicks from you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.75),
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                Container(
                  height: 100,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    gradient: AppConstants.getGradByName('maingreen'),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: AppColors.black.withOpacity(0.25),
                      )
                    ]
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (list.contains('')) {
                          } else {
                            list.add('');
                            list.sort();
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text('Add your first contact',
                          style: TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ))),
                ),
              ],
            ),
          ),
        )
      ];
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.bg,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: cardsList),
            ),
          ),
          
        ),
      ),
      floatingActionButton: list.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (list.contains('')) {
                  } else {
                    list.add('');
                    list.sort();
                  }
                });
              },
              backgroundColor: Colors.transparent,
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(
                    Icons.add,
                    color: AppColors.font,
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppConstants.getGradByName('maingreen')),
              ),
            ),
    );
  }
}
