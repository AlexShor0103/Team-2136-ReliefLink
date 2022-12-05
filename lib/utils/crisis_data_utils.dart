class CrisisData {
  String reasonToLive;
  String firstWarningSign;
  String secondWarningSign;
  String thirdWarningSign;
  //step 2
  String firstCopingStrategy;
  String secondCopingStrategy;
  String thirdCopingStrategy;
  //step 3
  String firstDistractingContact;
  String secondDistractingContact;
  String distractingPlace;
  //step 4
  String firstHelpingContact;
  String secondHelpingContact;
  String thirdHelpingContact;
  //step 5
  String firstProfessionalContact;
  String secondProfessionalContact;
  String localUrgentCare;
  //step 6
  String firstEnvironmentalSafetyStep;
  String secondEnvironmentalSafetyStep;

  CrisisData({
    required this.reasonToLive,
    required this.firstWarningSign,
    required this.secondWarningSign,
    required this.thirdWarningSign,
    required this.firstCopingStrategy,
    required this.secondCopingStrategy,
    required this.thirdCopingStrategy,
    required this.firstDistractingContact,
    required this.secondDistractingContact,
    required this.distractingPlace,
    required this.firstHelpingContact,
    required this.secondHelpingContact,
    required this.thirdHelpingContact,
    required this.firstProfessionalContact,
    required this.secondProfessionalContact,
    required this.localUrgentCare,
    required this.firstEnvironmentalSafetyStep,
    required this.secondEnvironmentalSafetyStep,
  });

  CrisisData.blankAccount()
      : reasonToLive = "Write down what makes life worth living for you. Feel free to add as much as you'd like!",
        firstWarningSign = "Add a warning sign",
        secondWarningSign = "Add a warning sign",
        thirdWarningSign = "Add a warning sign",
        firstCopingStrategy = "Add a relief technique",
        secondCopingStrategy = "Add a relief technique",
        thirdCopingStrategy = "Add a relief technique",
        firstDistractingContact = "Add a distracting contact",
        secondDistractingContact = "Add a distracting contact",
        distractingPlace = "Add a distracting place",
        firstHelpingContact = "Add a helping contact",
        secondHelpingContact = "Add a helping contact",
        thirdHelpingContact = "Add a helping contact",
        firstProfessionalContact = "Add a licensed professional contact",
        secondProfessionalContact = "Add a licensed professional contact",
        localUrgentCare = "Add a local urgent care",
        firstEnvironmentalSafetyStep =
            "Tap here to set steps to make your location safer for you",
        secondEnvironmentalSafetyStep = "Tap here to set steps to make your location safer for you";
  CrisisData.fromJson(Map<String, dynamic> json)
      : reasonToLive = json['reasonToLive'],
        firstWarningSign = json['firstWarningSign'],
        secondWarningSign = json['secondWarningSign'],
        thirdWarningSign = json['thirdWarningSign'],
        firstCopingStrategy = json['firstCopingStrategy'],
        secondCopingStrategy = json['secondCopingStrategy'],
        thirdCopingStrategy = json['thirdCopingStrategy'],
        firstDistractingContact = json['firstDistractingContact'],
        secondDistractingContact = json['secondDistractingContact'],
        distractingPlace = json['distractingPlace'],
        firstHelpingContact = json['firstHelpingContact'],
        secondHelpingContact = json['secondHelpingContact'],
        thirdHelpingContact = json['thirdHelpingContact'],
        firstProfessionalContact = json['firstProfessionalContact'],
        secondProfessionalContact = json['secondProfessionalContact'],
        localUrgentCare = json['localUrgentCare'],
        firstEnvironmentalSafetyStep = json['firstEnvironmentalSafetyStep'],
        secondEnvironmentalSafetyStep = json['secondEnvironmentalSafetyStep'];

  Map<String, dynamic> toJson() {
    return {
      'reasonToLive': reasonToLive,
      'firstWarningSign': firstWarningSign,
      'secondWarningSign': secondWarningSign,
      'thirdWarningSign': thirdWarningSign,
      'firstCopingStrategy': firstCopingStrategy,
      'secondCopingStrategy': secondCopingStrategy,
      'thirdCopingStrategy': thirdCopingStrategy,
      'firstDistractingContact': firstDistractingContact,
      'secondDistractingContact': secondDistractingContact,
      'distractingPlace': distractingPlace,
      'firstHelpingContact': firstHelpingContact,
      'secondHelpingContact': secondHelpingContact,
      'thirdHelpingContact': thirdHelpingContact,
      'firstProfessionalContact': firstProfessionalContact,
      'secondProfessionalContact': secondProfessionalContact,
      'localUrgentCare': localUrgentCare,
      'firstEnvironmentalSafetyStep': firstEnvironmentalSafetyStep,
      'secondEnvironmentalSafetyStep': secondEnvironmentalSafetyStep,
    };
  }
}
