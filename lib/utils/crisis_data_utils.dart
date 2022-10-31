class CrisisData {
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


  CrisisData.blankAccount():
        firstWarningSign = "Tap here to set warning signs that you are in a dangerous state",
        secondWarningSign = "",
        thirdWarningSign = "",
        firstCopingStrategy = "Tap here to set coping strategies that you know help you",
        secondCopingStrategy = "",
        thirdCopingStrategy = "",
        firstDistractingContact = "Tap here to set a person who can distract you",
        secondDistractingContact = "",
        distractingPlace = "Tap here to set a place that can distract you",
        firstHelpingContact = "Tap here to set a person that can help you",
        secondHelpingContact = "",
        thirdHelpingContact = "",
        firstProfessionalContact = "Tap here to set a counselor or psychologist you can contact",
        secondProfessionalContact = "",
        localUrgentCare = "Tap here to set your local urgent care",
        firstEnvironmentalSafetyStep = "Tap here to set steps to make your location safer for you",
        secondEnvironmentalSafetyStep = "";
  CrisisData.fromJson(Map<String, dynamic> json):
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