import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
    String inputVal = "";
    bool enableEdit = false;
    bool editIcon = true;
    bool showConfidential = label == "Insurance Company Name"
        ? showInsuranceCompanyNameConfidential
        : (label == "Policy Number"
            ? showPolicyNumberConfidential
            : showMemberIDConfidential);
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: (TextField(
        enabled: enableEdit,
        onChanged: (value) => {inputVal = value},
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
                      enableEdit = !enableEdit;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    enableEdit = !enableEdit;
                    editIcon = !editIcon;
                    if (label == "First Name") {
                      firstName = inputVal;
                    } else if (label == "Last Name") {
                      lastName = inputVal;
                    } else if (label == "Age") {
                      age = inputVal;
                    } else if (label == "Insureance Company Name") {
                      insuranceCompanyName = inputVal;
                    } else if (label == "Policy Number") {
                      policyNumber = inputVal;
                    } else if (label == "Member ID") {
                      memberID = inputVal;
                    }
                  },
                  icon: editIcon
                      ? Icon(
                          Icons.edit,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.check_outlined,
                          color: Colors.grey,
                        ),
                ),
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
