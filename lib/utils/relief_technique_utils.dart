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

  void toggleActivityFavorite() {
    favorite = !favorite;
  }
}
