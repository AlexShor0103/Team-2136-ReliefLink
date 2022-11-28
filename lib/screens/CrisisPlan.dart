import 'dart:core';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import '../../utils/crisis_data_utils.dart';
import '../../utils/data_storage.dart';

class CrisisPlan extends StatefulWidget {
  @override
  _CrisisPlanState createState() => _CrisisPlanState();
}

class _CrisisPlanState extends State<CrisisPlan> {
  //step 1
  String firstWarningSign = "";
  String secondWarningSign = "";
  String thirdWarningSign = "";
  //step 2
  String firstCopingStrategy = "";
  String secondCopingStrategy = "";
  String thirdCopingStrategy = "";
  //step 3
  String firstDistractingContact = "";
  String secondDistractingContact = "";
  String distractingPlace = "";
  //step 4
  String firstHelpingContact = "";
  String secondHelpingContact = "";
  String thirdHelpingContact = "";
  //step 5
  String firstProfessionalContact = "";
  String secondProfessionalContact = "";
  String localUrgentCare = "";
  //step 6
  String firstEnvironmentalSafetyStep = "";
  String secondEnvironmentalSafetyStep = "";

  @override
  void initState() {
    super.initState();
    CrisisData? data = DataStorage.getCrisisData();
    if (data == null) {
      DataStorage.init().then((success) {
        data = DataStorage.getCrisisData();
      }).then((arg) {
        firstWarningSign = data!.firstWarningSign;
        secondWarningSign = data!.secondWarningSign;
        thirdWarningSign = data!.thirdWarningSign;
        firstCopingStrategy = data!.firstCopingStrategy;
        secondCopingStrategy = data!.secondCopingStrategy;
        thirdCopingStrategy = data!.thirdCopingStrategy;
        firstDistractingContact = data!.firstDistractingContact;
        secondDistractingContact = data!.secondDistractingContact;
        distractingPlace = data!.distractingPlace;
        firstHelpingContact = data!.firstHelpingContact;
        secondHelpingContact = data!.secondHelpingContact;
        thirdHelpingContact = data!.thirdHelpingContact;
        firstProfessionalContact = data!.firstProfessionalContact;
        secondProfessionalContact = data!.secondProfessionalContact;
        localUrgentCare = data!.localUrgentCare;
        firstEnvironmentalSafetyStep = data!.firstEnvironmentalSafetyStep;
        secondEnvironmentalSafetyStep = data!.secondEnvironmentalSafetyStep;
        setState(() {}); //Manually call build
      });
    } else {
      firstWarningSign = data.firstWarningSign;
      secondWarningSign = data.secondWarningSign;
      thirdWarningSign = data.thirdWarningSign;
      firstCopingStrategy = data.firstCopingStrategy;
      secondCopingStrategy = data.secondCopingStrategy;
      thirdCopingStrategy = data.thirdCopingStrategy;
      firstDistractingContact = data.firstDistractingContact;
      secondDistractingContact = data.secondDistractingContact;
      distractingPlace = data.distractingPlace;
      firstHelpingContact = data.firstHelpingContact;
      secondHelpingContact = data.secondHelpingContact;
      thirdHelpingContact = data.thirdHelpingContact;
      firstProfessionalContact = data.firstProfessionalContact;
      secondProfessionalContact = data.secondProfessionalContact;
      localUrgentCare = data.localUrgentCare;
      firstEnvironmentalSafetyStep = data.firstEnvironmentalSafetyStep;
      secondEnvironmentalSafetyStep = data.secondEnvironmentalSafetyStep;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(252, 245, 235, 1),
            body: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        warningCard(),
                        const SizedBox(height: 20),
                        reliefCard(),
                        const SizedBox(height: 20),
                        distractingContactsCard(),
                        const SizedBox(height: 20),
                        helpingContactsCard(),
                        const SizedBox(height: 20),
                        professionalContactsCard(),
                      ] // Children
                      ),
                ] // Children
                )));
  }

  Widget warningCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 330,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Step 1: Warning Signs",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
                height: 40,
                constraints: BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              //spacer
              const SizedBox(height: 8),
              // text for the intro
              Text("Here we identify warning signs before crisis",
                  style: TextStyle(
                    color: AppColors.font.withOpacity(0.75),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              SizedBox(height: 15),
              warningTextInput("Warning 1:", firstWarningSign),
              SizedBox(height: 15),
              warningTextInput("Warning 2:", firstWarningSign),
              SizedBox(height: 15),
              warningTextInput("Warning 3:", firstWarningSign),
            ],
          )),
    );
  }
  Widget warningTextInput(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )
          ),
          TextField(
            onChanged: (value) => {
              if (label == "Warning 1:") {
                firstWarningSign = value
              } else if (label == "Warning 2:") {
                secondWarningSign = value
              } else if (label == "Warning 3:") {
                thirdWarningSign = value
              }
            },
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
              // labelText: label,
              // labelStyle: TextStyle(
              //   color: AppColors.font,
              //   fontFamily: 'MainFont',
              //   fontWeight: FontWeight.w600,
              //   fontSize: 17,
              // )
            ),
          )
        ]
      )
      
    );
  }

  Widget reliefCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 330,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Step 2: Relief Techniques",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
                height: 40,
                constraints: BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              //spacer
              const SizedBox(height: 8),
              // text for the intro
              Text("Here we identify relief techniques that help",
                  style: TextStyle(
                    color: AppColors.font.withOpacity(0.75),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              SizedBox(height: 15),
              reliefTextInput("Relief Technique 1:", firstCopingStrategy),
              SizedBox(height: 15),
              reliefTextInput("Relief Technique 2:", secondCopingStrategy),
              SizedBox(height: 15),
              reliefTextInput("Relief Technique 3:", thirdCopingStrategy),
            ],
          )),
    );
  }
  Widget reliefTextInput(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )
          ),
          TextField(
            onChanged: (value) => {
              if (label == "Relief Technique 1:") {
                firstCopingStrategy = value
              } else if (label == "Relief Technique 2:") {
                secondCopingStrategy = value
              } else if (label == "Relief Technique 3:") {
                thirdCopingStrategy = value
              }
            },
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]
      )
      
    );
  }

  Widget distractingContactsCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 330,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Step 3: Sources of Distraction",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
                height: 40,
                constraints: BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              //spacer
              const SizedBox(height: 8),
              // text for the intro
              Text("Here we list resources that can distract you",
                  style: TextStyle(
                    color: AppColors.font.withOpacity(0.75),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              SizedBox(height: 15),
              distractingContactsInput("Distracting Contact 1:", firstDistractingContact),
              SizedBox(height: 15),
              distractingContactsInput("Distracting Contact 2:", secondDistractingContact),
              SizedBox(height: 15),
              distractingContactsInput("Distracting Place:", distractingPlace),
            ],
          )),
    );
  }
  Widget distractingContactsInput(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )
          ),
          TextField(
            onChanged: (value) => {
              if (label == "Distracting Contact 1:") {
                firstDistractingContact = value
              } else if (label == "Distracting Contact 2:") {
                secondDistractingContact = value
              } else if (label == "Distracting Place") {
                distractingPlace = value
              }
            },
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]
      )
      
    );
  }

  Widget helpingContactsCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 330,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Step 4: Sources of Help",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
                height: 40,
                constraints: BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              //spacer
              const SizedBox(height: 8),
              // text for the intro
              Text("Here we list contacts that can help you",
                  style: TextStyle(
                    color: AppColors.font.withOpacity(0.75),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              SizedBox(height: 15),
              reliefTextInput("Helping Contact 1:", firstHelpingContact),
              SizedBox(height: 15),
              reliefTextInput("Helping Contact 2:", secondHelpingContact),
              SizedBox(height: 15),
              reliefTextInput("Helping Contact 3:", thirdHelpingContact),
            ],
          )),
    );
  }
  Widget helpingContactsInput(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )
          ),
          TextField(
            onChanged: (value) => {
              if (label == "Helping Contact 1:") {
                firstHelpingContact = value
              } else if (label == "Helping Contact 2:") {
                secondHelpingContact = value
              } else if (label == "Helping Contact 3:") {
                thirdHelpingContact = value
              }
            },
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]
      )
      
    );
  }

  Widget professionalContactsCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 330,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Step 5: Professional Resources",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.font,
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
                height: 40,
                constraints: BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              //spacer
              const SizedBox(height: 8),
              // text for the intro
              Text("Here we list professional Mental Health Resources",
                  style: TextStyle(
                    color: AppColors.font.withOpacity(0.75),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              SizedBox(height: 15),
              professionalContactsInput("Professional Contact 1:", firstProfessionalContact),
              SizedBox(height: 15),
              professionalContactsInput("Professional Contact 2:", secondProfessionalContact),
              SizedBox(height: 15),
              professionalContactsInput("Local Urgent Care:", localUrgentCare),
            ],
          )),
    );
  }
  Widget professionalContactsInput(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )
          ),
          TextField(
            onChanged: (value) => {
              if (label == "Professional Contact 1:") {
                firstProfessionalContact = value
              } else if (label == "Professional Contact 2:") {
                secondProfessionalContact = value
              } else if (label == "Local Urgent Care:") {
                localUrgentCare = value
              }
            },
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]
      )
      
    );
  }

  Widget textInputs(String label, String placeholder) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: (TextField(
            onChanged: (value) => {
                  if (label == "First Warning Sign")
                    {firstWarningSign = value}
                  else if (label == "Second Warning Sign")
                    {secondWarningSign = value}
                  else if (label == "Third Warning Sign")
                    {thirdWarningSign = value}
                  else if (label == "First Coping Strategy")
                    {firstCopingStrategy = value}
                  else if (label == "Second Coping Strategy")
                    {secondCopingStrategy = value}
                  else if (label == "Third Coping Strategy")
                    {thirdCopingStrategy = value}
                  else if (label == "First Distracting Contact")
                    {firstDistractingContact = value}
                  else if (label == "Second Distracting Contact")
                    {secondDistractingContact = value}
                  else if (label == "Distracting Place")
                    {distractingPlace = value}
                  else if (label == "First Helping Contact")
                    {firstHelpingContact = value}
                  else if (label == "Second Helping Contact")
                    {secondHelpingContact = value}
                  else if (label == "Third Helping Contact")
                    {thirdHelpingContact = value}
                  else if (label == "First Professional Contact")
                    {firstProfessionalContact = value}
                  else if (label == "Second Professional Contact")
                    {secondProfessionalContact = value}
                  else if (label == "Local Urgent Care")
                    {localUrgentCare = value}
                  else if (label == "First Environmental Step")
                    {firstEnvironmentalSafetyStep = value}
                  else
                    {secondEnvironmentalSafetyStep = value}
                },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 3),
                labelText: label,
                labelStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(0.9),
                )))));
  }
}
