import 'dart:core';

import 'package:flutter/material.dart';
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
        backgroundColor: Color.fromRGBO(252, 245, 235, 1),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // IconButton(
                //     onPressed: (() {
                //       setState(() {});
                //         CrisisData newData = CrisisData(
                //             firstWarningSign: firstWarningSign,
                //             secondWarningSign: secondWarningSign,
                //             thirdWarningSign: thirdWarningSign,
                //             firstCopingStrategy: firstCopingStrategy,
                //             secondCopingStrategy: secondCopingStrategy,
                //             thirdCopingStrategy: thirdCopingStrategy,
                //             firstDistractingContact: firstDistractingContact,
                //             secondDistractingContact: secondDistractingContact,
                //             distractingPlace: distractingPlace,
                //             firstHelpingContact: firstHelpingContact,
                //             secondHelpingContact: secondHelpingContact,
                //             thirdHelpingContact: thirdHelpingContact,
                //             firstProfessionalContact: firstProfessionalContact,
                //             secondProfessionalContact: secondProfessionalContact,
                //             localUrgentCare: localUrgentCare,
                //             firstEnvironmentalSafetyStep: firstEnvironmentalSafetyStep,
                //             secondEnvironmentalSafetyStep: secondEnvironmentalSafetyStep
                //         );
                //         DataStorage.setCrisisData(newData);
                //         DataStorage.saveToDisk();
                //       }),
                //       icon: const Icon(
                //         Icons.sync,
                //         size: 35,
                //         color: Colors.grey,
                //       ),
                //     ),
                const Text(
                  'Step 1 - Warning signs (thoughts, mood, '
                      'behavior) that a crisis may be developing:',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Warning Sign", firstWarningSign),
                textInputs("Second Warning Sign", secondWarningSign),
                textInputs("Third Warning Sign", thirdWarningSign),
                const Text(
                  'Step 2 - Internal coping strategies - Things I can do myself '
                      'to take my mind off my problems:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Coping Strategy", firstWarningSign),
                textInputs("Second Coping Strategy", secondCopingStrategy),
                textInputs("Third Coping Strategy", thirdCopingStrategy),
                const Text(
                  'Step 3 - People and social settings that provide distraction:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Distracting Contact", firstDistractingContact),
                textInputs("Second Distracting Contact", secondDistractingContact),
                textInputs("Distracting Place", distractingPlace),
                const Text(
                  'Step 4 - People I can ask for help:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Helping Contact", firstHelpingContact),
                textInputs("Second Helping Contact", secondHelpingContact),
                textInputs("Third Helping Contact", thirdHelpingContact),
                const Text(
                  'Step 5 - Professionals or agencies I can contact during a crisis:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Professional Contact", firstProfessionalContact),
                textInputs("Second Professional Contact", secondProfessionalContact),
                textInputs("Local Urgent Care", localUrgentCare),
                const Text(
                  'Step 6 - Making my environment safe:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent),
                ),
                const SizedBox(
                  height: 25,
                ),
                textInputs("First Environmental Step", firstEnvironmentalSafetyStep),
                textInputs("Second Environmental Step", secondEnvironmentalSafetyStep),
                  ]  // Children
                ),
            ] // Children
        )
      )
    );
  }

  Widget textInputs(String label, String placeholder) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: (TextField(
            onChanged: (value) =>
            {
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
                {secondEnvironmentalSafetyStep = value }
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
                )
            )
        ))
    );
  }
}
