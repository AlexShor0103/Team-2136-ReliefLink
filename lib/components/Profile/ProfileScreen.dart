import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showInsuranceNameConfidential = false;
  bool showInsurancePNConfidential = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Stack(
              children: [
                avatars(),
                avatarEdit(context),
                //TODO
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'firstName LastName',
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
          textInputs("First Name", "firstName", false),
          textInputs("Last Name", "lastName", false),
          textInputs("Email", "burdell@gatech.edu", false),
          const Text(
            'Insurance Information',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(
            height: 35,
          ),
          textInputs("Insurance Name", "*****", true),
          textInputs("Insurance Policy Number", "*****", true),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: const Text("CANCEL",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                ),
              )
            ],
          ),
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
        child: const Icon(
          Icons.edit,
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
    // bool showConfidential = true;
    bool showConfidential = label == "Insurance Name"
        ? showInsuranceNameConfidential
        : showInsurancePNConfidential;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: (TextField(
        obscureText: isConfidential
            ? (label == "Insurance Name"
                ? showInsuranceNameConfidential
                : showInsurancePNConfidential)
            : false,
        decoration: InputDecoration(
          suffixIcon: isConfidential
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (label == "Insurance Name") {
                        showInsuranceNameConfidential =
                            !showInsuranceNameConfidential;
                      } else {
                        showInsurancePNConfidential =
                            !showInsurancePNConfidential;
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
