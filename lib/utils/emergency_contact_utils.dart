class EmergencyContactData {
  String name;
  String id;
  String phoneNumber;
  bool email;
  EmergencyContactData(
      {required this.name,
        required this.id,
        required this.phoneNumber,
        required this.email});

  EmergencyContactData.fromJson(Map<String, dynamic> json):
      name = json['name'],
      id = json['id'],
      phoneNumber = json['phoneNumber'],
      email = json['email'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'phoneNumber': phoneNumber,
      'email': email
    };
  }
}
