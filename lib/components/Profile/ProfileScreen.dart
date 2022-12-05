import 'dart:convert';

import 'package:flutter/material.dart';
import '../../utils/user_account_utils.dart';
import '../../utils/data_storage.dart';
import 'package:relieflink/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showInsuranceCompanyNameConfidential = false;
  bool showPolicyNumberConfidential = false;
  bool showMemberIDConfidential = false;

  String firstName = "";
  String lastName = "";
  String age = "";
  String insuranceCompanyName = "";
  String policyNumber = "";
  String memberID = "";

  @override
  void initState() {
    super.initState();
    UserAccountData? data = DataStorage.getUserAccountData();
    if (data == null) {
      DataStorage.init().then((success) {
        data = DataStorage.getUserAccountData();
      }).then((arg) {
        firstName = data!.firstName;
        lastName = data!.lastName;
        age = data!.age;
        insuranceCompanyName = data!.insuranceCompanyName;
        policyNumber = data!.policyNumber;
        memberID = data!.memberID;
        setState(() {}); // Manually call build
      });
    } else {
      firstName = data.firstName;
      lastName = data.lastName;
      age = data.age;
      insuranceCompanyName = data.insuranceCompanyName;
      policyNumber = data.policyNumber;
      memberID = data.memberID;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: AppColors.bg,
          child: ListView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    avatars(),
                    avatarEdit(context),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "${firstName} ${lastName}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {
                      setState(() {}); // Manually call build
                      UserAccountData newData = new UserAccountData(
                        firstName: firstName,
                        lastName: lastName,
                        age: age,
                        memberID: memberID,
                        policyNumber: policyNumber,
                        insuranceCompanyName: insuranceCompanyName,
                      );
                      DataStorage.setUserAccountData(newData);
                      DataStorage.saveToDisk();
                    }),
                    icon: Icon(
                      Icons.sync,
                      size: 35,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Text(
                'Personal Information',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 35,
              ),
              textInputs("First Name", firstName, false),
              textInputs("Last Name", lastName, false),
              textInputs("Age", age, false),
              const Text(
                'Insurance Information',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 35,
              ),
              textInputs("Insurance Company Name", insuranceCompanyName, true),
              textInputs("Policy Number", policyNumber, true),
              textInputs("Member ID", memberID, true)
            ],
          ),
      
        ),
        
        ),
    );
  }

  Positioned avatarEdit(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          color: const Color(0xffF9CB9A),
        ),
        child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => {
            //TODO: change pics.
          },
          color: Colors.white,
        ),
      ),
    );
  }

  Container avatars() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(
            width: 4, color: Theme.of(context).scaffoldBackgroundColor),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
          )
        ],
        shape: BoxShape.circle,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('lib/components/Profile/yellowJackets.png'),
        ),
      ),
    );
  }

  Widget textInputs(String label, String placeholder, bool isConfidential) {
    bool showConfidential = label == "Insurance Company Name"
        ? showInsuranceCompanyNameConfidential
        : (label == "Policy Number"
            ? showPolicyNumberConfidential
            : showMemberIDConfidential);
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: (TextField(
        onChanged: (value) => {
          if (label == "Insurance Company Name")
            {insuranceCompanyName = value}
          else if (label == "Policy Number")
            {policyNumber = value}
          else if (label == "Member ID")
            {memberID = value}
          else if (label == "First Name")
            {firstName = value}
          else if (label == "Last Name")
            {lastName = value}
          else
            {age = value}
        },
        obscureText: isConfidential
            ? (label == "Insurance Company Name"
                ? showInsuranceCompanyNameConfidential
                : (label == "Policy Number"
                    ? showPolicyNumberConfidential
                    : showMemberIDConfidential))
            : false,
        decoration: InputDecoration(
          suffixIcon: isConfidential
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (label == "Insurance Company Name") {
                        showInsuranceCompanyNameConfidential =
                            !showInsuranceCompanyNameConfidential;
                      } else if (label == "Policy Number") {
                        showPolicyNumberConfidential =
                            !showPolicyNumberConfidential;
                      } else {
                        showMemberIDConfidential = !showMemberIDConfidential;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
      )),
    );
  }
}
