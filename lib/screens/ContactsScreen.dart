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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cardsList),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(Icons.add),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppConstants.gradsByMood['anxious']),
        ),
      ),
    );
  }
}
