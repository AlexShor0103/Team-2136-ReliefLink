import 'dart:core';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import '../../utils/crisis_data_utils.dart';
import '../../utils/data_storage.dart';
import 'package:relieflink/components/CrisisPlan/warningSignsCrisisCard.dart';
import 'package:relieflink/components/CrisisPlan/reliefTechniqueCrisisCard.dart';

class CrisisPlan extends StatefulWidget {
  const CrisisPlan({Key? key}) : super(key: key);
  @override
  State<CrisisPlan> createState() => _CrisisPlanState();
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
    return Scaffold(
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
                    const SizedBox(height: 40),
                    warningCard(),
                    const SizedBox(height: 20),
                    reliefCard(),
                    const SizedBox(height: 20),
                    distractingContactsCard(),
                    const SizedBox(height: 20),
                    helpingContactsCard(),
                    const SizedBox(height: 20),
                    professionalContactsCard(),
                    const SizedBox(height: 40),
                  ] // Children
                  ),
            ] // Children
            ));
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
                    borderRadius: BorderRadius.only(
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
              const SizedBox(height: 15),
              warningTextInputAuto("Warning 1:", firstWarningSign),
              const SizedBox(height: 15),
              warningTextInputAuto("Warning 2:", secondWarningSign),
              const SizedBox(height: 15),
              warningTextInputAuto("Warning 3:", thirdWarningSign),
            ],
          )),
    );
  }

  Widget reliefCard() {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 350,
          child: Column(
            children: [
              //container for gradient
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Step 2: Relief Techniques",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.font,
                          fontFamily: 'MainFont',
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showReliefEditDialogue(context);
                        },
                        child: Container(
                            height: 30, width: 30, color: AppColors.bg),
                      ),
                    ],
                  ),
                ),
                height: 50,
                constraints: const BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: BorderRadius.only(
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
              const SizedBox(height: 15),
              reliefTextInput("Relief Technique 1:", firstCopingStrategy),
              const SizedBox(height: 15),
              reliefTextInput("Relief Technique 2:", secondCopingStrategy),
              const SizedBox(height: 15),
              reliefTextInput("Relief Technique 3:", thirdCopingStrategy),
            ],
          )),
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
                constraints: const BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: BorderRadius.only(
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
              const SizedBox(height: 15),
              distractingContactsInput(
                  "Distracting Contact 1:", firstDistractingContact),
              const SizedBox(height: 15),
              distractingContactsInput(
                  "Distracting Contact 2:", secondDistractingContact),
              const SizedBox(height: 15),
              distractingContactsInput("Distracting Place:", distractingPlace),
            ],
          )),
    );
  }

  Widget distractingContactsInput(String label, String placeholder) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )),
          TextField(
            onChanged: (value) => {
              if (label == "Distracting Contact 1:")
                {firstDistractingContact = value}
              else if (label == "Distracting Contact 2:")
                {secondDistractingContact = value}
              else if (label == "Distracting Place")
                {distractingPlace = value}
            },
            style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w600,
                fontSize: 18),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]));
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
                constraints: const BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: BorderRadius.only(
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
              const SizedBox(height: 15),
              reliefTextInput("Helping Contact 1:", firstHelpingContact),
              const SizedBox(height: 15),
              reliefTextInput("Helping Contact 2:", secondHelpingContact),
              const SizedBox(height: 15),
              reliefTextInput("Helping Contact 3:", thirdHelpingContact),
            ],
          )),
    );
  }

  Widget helpingContactsInput(String label, String placeholder) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )),
          TextField(
            onChanged: (value) => {
              if (label == "Helping Contact 1:")
                {firstHelpingContact = value}
              else if (label == "Helping Contact 2:")
                {secondHelpingContact = value}
              else if (label == "Helping Contact 3:")
                {thirdHelpingContact = value}
            },
            style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w600,
                fontSize: 18),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]));
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
                constraints: const BoxConstraints(minWidth: double.infinity),
                decoration: const BoxDecoration(
                    gradient: AppGrads.mainGreen,
                    borderRadius: BorderRadius.only(
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
              const SizedBox(height: 15),
              professionalContactsInput(
                  "Professional Contact 1:", firstProfessionalContact),
              const SizedBox(height: 15),
              professionalContactsInput(
                  "Professional Contact 2:", secondProfessionalContact),
              const SizedBox(height: 15),
              professionalContactsInput("Local Urgent Care:", localUrgentCare),
            ],
          )),
    );
  }

  Widget professionalContactsInput(String label, String placeholder) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: const TextStyle(
                height: 0,
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w900,
                fontSize: 17,
              )),
          TextField(
            onChanged: (value) => {
              if (label == "Professional Contact 1:")
                {firstProfessionalContact = value}
              else if (label == "Professional Contact 2:")
                {secondProfessionalContact = value}
              else if (label == "Local Urgent Care:")
                {localUrgentCare = value}
            },
            style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w600,
                fontSize: 18),
            decoration: InputDecoration(
              isDense: true,
              hintText: placeholder,
            ),
          )
        ]));
  }
}
