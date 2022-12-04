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
    void showReliefEditDialogue(BuildContext context) {
      //storing temporary values before getting confirmed or ignored
      String t1 = firstCopingStrategy;
      String t2 = secondCopingStrategy;
      String t3 = thirdCopingStrategy;

      //on confirm, put temporary values into permanent values
      Widget confirmButton = TextButton(
        child: Text("Confirm"),
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            firstCopingStrategy = t1;
            debugPrint("p1 has become: " + firstCopingStrategy);
            secondCopingStrategy = t2;
            thirdCopingStrategy = t3;
          });

          //somehow save the code properly
        },
      );

      //on cancel nothing extraordinary happens
      Widget cancelButton = TextButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      //this is just the row of both of them
      Widget ConfirmCancel = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [cancelButton, confirmButton],
      );

      //this is the dialog that will appear if the player presses the edit icon
      AlertDialog alert = AlertDialog(
          title: const Text("Choose Relief Techniques", style: TextStyle()),
          content: Column(children: [
            const Text(
              "Here you can choose which Relief Techniques you would like to include",
              textAlign: TextAlign.center,
            ),
            ReliefTextDropdown(
              label: "Relief Technique 1:",
              curVal: firstCopingStrategy,
              setFunc: (String value) {
                t1 = value;
              }),
            ReliefTextDropdown(
                label: "Relief Technique 2:",
                curVal: secondCopingStrategy,
                setFunc: (String value) {
                  t2 = value;
                }),
            ReliefTextDropdown(
                label: "Relief Technique 3:",
                curVal: thirdCopingStrategy,
                setFunc: (String value) {
                  t3 = value;
                }),
          ]),
          actions: [
            // const SizedBox(height: 10),
            ConfirmCancel
          ]);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          height: 360,
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
                      IconButton(
                        onPressed: () {
                          showReliefEditDialogue(context);
                          // firstCopingStrategy = "ahh";
                        },
                        icon: Icon(Icons.edit),
                        color: AppColors.font,
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
              
              reliefInput("Relief Technique 1: ", firstCopingStrategy),
              // reliefTextInput("Relief Technique 1:", firstCopingStrategy),
              const SizedBox(height: 15),
              reliefInput("Relief Technique 2: ", secondCopingStrategy),
              // reliefTextInput("Relief Technique 2:", secondCopingStrategy),
              const SizedBox(height: 15),
              reliefInput("Relief Technique 3: ", thirdCopingStrategy),
              // reliefTextInput("Relief Technique 3:", thirdCopingStrategy),
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
              helpingContactsInput("Helping Contact 1:", firstHelpingContact),
              const SizedBox(height: 15),
              helpingContactsInput("Helping Contact 2:", secondHelpingContact),
              const SizedBox(height: 15),
              helpingContactsInput("Helping Contact 3:", thirdHelpingContact),
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

/*when the dialog completes, it should update the state of the relieftechniques right?
So we need to have a general relieftehcniquecard class that deals with updating.
For one we need those buttons, which can come in the form of regular button widgets.

use setState to rerun the widget. The widget will contain three finals? No It will
contain just key. Inside of state, we'll have 3 reliefTechnique Datas whose values are set
to the search from the Strings that are the coping strategies.

inside of the widget, widgets will take a relief technique data obj and construct a button from that.
*/

// class ReliefButton extends StatefulWidget {
//   const ReliefButton({Key? key}) : super(key: key);
//   @override
//   State<ReliefButton> createState() => _ReliefButtonState();
// }

// class _ReliefButtonState extends State<ReliefButton> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
