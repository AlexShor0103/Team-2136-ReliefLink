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

    String? contactNumber = contact?.phoneNumber;
    String? name = contact?.name;
    String? relation = contact?.relation;

    Future<bool> _showMyDialog(BuildContext context) async {
      await DataStorage.init();
      showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  BackButton(),
                  const Text('Edit Contact',
                      style: TextStyle(
                        color: AppColors.font,
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      )),
                ],
              ),
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
                            name = value ?? 'Contact\'s name';
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
                            relation = value ?? 'Contact\'s relation';
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
                            contactNumber = value ?? 'Contact\'s phone number';
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
                    if (name != '' && contactNumber != '' && relation != '') {
                      await DataStorage.init();
                      DataStorage.addEmergencyContact(EmergencyContactData(
                          name: name ?? '',
                          id: contactId,
                          phoneNumber: contactNumber ?? '',
                          relation: relation ?? ''));
                      DataStorage.saveToDisk();
                    }
                    widget.update();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      return true;
    }

    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: AppConstants.getGradByName('distractingContact'),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  height: 200 * 0.2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name ?? 'Contact\'s name',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: AppColors.font,
                                  fontFamily: 'MainFont',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                )),
                            Text(relation ?? 'Contact\'s relation',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: AppColors.font,
                                    fontFamily: 'MainFont',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              _showMyDialog(context);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.black,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(contactNumber ?? 'Contact\'s phone number',
                            style: const TextStyle(
                                color: AppColors.font,
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.w200,
                                fontSize: 16)),
                        Spacer(flex: 1),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppConstants.getGradByName('distractingContact'),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: IconButton(
                                color: Colors.transparent,
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "sms:+1" + (contactNumber ?? '')));
                                },
                                icon: const Icon(
                                  Icons.chat_rounded,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppConstants.getGradByName('distractingContact'),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: IconButton(
                                color: Colors.transparent,
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "tel://" + (contactNumber ?? '')));
                                },
                                icon: const Icon(
                                  Icons.call,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
