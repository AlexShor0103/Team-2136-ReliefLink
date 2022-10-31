class EmergencyContactData {
  String name;
  String id;
  String phoneNumber;
  String relation;
  EmergencyContactData(
      {required this.name,
      required this.id,
      required this.phoneNumber,
      required this.relation});

  EmergencyContactData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        phoneNumber = json['phoneNumber'],
        relation = json['relation'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'phoneNumber': phoneNumber,
      'relation': relation
    };
  }
}
