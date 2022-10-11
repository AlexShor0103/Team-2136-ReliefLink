class ReliefTechniqueData {
  String videoLink;
  String activityName;
  String mood;
  bool favorite;
  int duration;
  ReliefTechniqueData(
      {required this.videoLink,
      required this.activityName,
      required this.favorite,
      required this.mood,
      required this.duration});

  ReliefTechniqueData.fromJson(Map<String, dynamic> json):
      videoLink = json['videoLink'],
      activityName = json['activityName'],
      mood = json['mood'],
      favorite = json['favorite'],
      duration = json['duration'];

  Map<String, dynamic> toJson() {
    return {
      'videoLink': videoLink,
      'activityName': activityName,
      'mood': mood,
      'favorite': favorite,
      'duration': duration
    };
  }

  void toggleActivityFavorite() {
    favorite = !favorite;
  }
}
