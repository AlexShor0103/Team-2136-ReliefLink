import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/data_storage.dart';
import '../utils/emergency_contact_utils.dart';

class EmergencyContact extends StatefulWidget {
  final String contactIdPassed;
  final void Function() update;
  const EmergencyContact(
      {Key? key, required this.contactIdPassed, required this.update})
      : super(key: key);

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    EmergencyContactData? contact =
        DataStorage.getEmergencyContact(widget.contactIdPassed);
    String contactId = '';

    if (contact == null) {
      var r = Random();
      contactId =
          String.fromCharCodes(List.generate(6, (index) => r.nextInt(33) + 89));
    } else {
      contactId = widget.contactIdPassed;
    }

    String contactNumber = contact?.phoneNumber ?? '';
    String name = contact?.name ?? '';
    String relation = contact?.relation ?? '';

    Future<bool> _showMyDialog(BuildContext context) async {
      await DataStorage.init();
      showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Edit Contact',
                  style: TextStyle(
                    color: AppColors.font,
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  )),
              content: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: name,
                          style: const TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                              hintText: 'Enter the name of your contact',
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: AppColors.font,
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              )),
                          onSaved: (String? value) {
                            name = value ?? '';
                          },
                        ),
                        TextFormField(
                          initialValue: relation,
                          style: const TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                              hintText: 'Enter your relation to your contact',
                              labelText: 'Relation to you',
                              labelStyle: TextStyle(
                                color: AppColors.font,
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              )),
                          onSaved: (String? value) {
                            relation = value ?? '';
                          },
                        ),
                        TextFormField(
                          initialValue: contactNumber,
                          style: const TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Enter their phone number',
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: AppColors.font,
                              fontFamily: 'MainFont',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          onSaved: (String? value) {
                            contactNumber = value ?? '';
                          },
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    )),
              )),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: AppColors.red,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    await DataStorage.init();
                    DataStorage.removeEmergencyContact(contactId);
                    widget.update();
                    DataStorage.saveToDisk();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    _formKey.currentState!.save();
                    await DataStorage.init();
                    DataStorage.addEmergencyContact(EmergencyContactData(
                        name: name,
                        id: contactId,
                        phoneNumber: contactNumber,
                        relation: relation));
                    DataStorage.saveToDisk();
                    widget.update();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      return true;
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black,
                  blurRadius: 5,
                  offset: Offset.fromDirection(1, 3))
            ]),
        height: 160,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(name,
                          style: const TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          )),
                      Text(relation,
                          style: const TextStyle(
                            color: AppColors.font,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        _showMyDialog(context);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.white,
                      ))
                ],
              ),
              Row(
                children: [
                  Text(contactNumber,
                      style: const TextStyle(
                        color: AppColors.font,
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 20,
                      child: IconButton(
                        color: AppColors.white,
                        onPressed: () {
                          launchUrl(Uri.parse("sms:+1" + contactNumber));
                        },
                        icon: const Icon(
                          Icons.chat_rounded,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 20,
                      child: IconButton(
                        color: AppColors.white,
                        onPressed: () {
                          launchUrl(Uri.parse("tel://" + contactNumber));
                        },
                        icon: const Icon(
                          Icons.call,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
