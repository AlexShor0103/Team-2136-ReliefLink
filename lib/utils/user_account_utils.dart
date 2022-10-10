class UserAccountData {
  String firstName;
  String lastName;
  String age;
  String insuranceCompanyName;
  String policyNumber;
  String memberID;

  UserAccountData({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.insuranceCompanyName,
    required this.policyNumber,
    required this.memberID,
  });

  UserAccountData.blankAccount():
    firstName = "",
    lastName = "",
    age = "",
    insuranceCompanyName = "",
    policyNumber = "",
    memberID = "";

  UserAccountData.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        age = json['age'],
        insuranceCompanyName = json['insuranceCompanyName'],
        policyNumber = json['policyNumber'],
        memberID = json['memberID'];

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'insuranceCompanyName': insuranceCompanyName,
      'policyNumber': policyNumber,
      'memberID': memberID,
    };
  }
}
