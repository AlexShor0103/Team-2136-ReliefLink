import 'dart:collection';

class ReliefTechniqueData {
  static const int storedRatings = 10;
  String videoLink;
  String activityName;
  String mood;
  bool favorite;
  int duration;
  Queue<double> ratings;
  double averageRating;
  ReliefTechniqueData(
      {required this.videoLink,
        required this.activityName,
        required this.mood,
        required this.favorite,
        required this.duration,
        Queue<double>? ratings,
        double? averageRating}):
        ratings = ratings ?? Queue(),
        averageRating = averageRating ?? -1;

  ReliefTechniqueData.fromJson(Map<String, dynamic> json):
      videoLink = json['videoLink'],
      activityName = json['activityName'],
      mood = json['mood'],
      favorite = json['favorite'],
      duration = json['duration'],
      ratings = json['ratings'] ?? Queue(), averageRating = 3 {
        averageRating = getAverageRating();
      }


  Map<String, dynamic> toJson() {
    return {
      'videoLink': videoLink,
      'activityName': activityName,
      'mood': mood,
      'favorite': favorite,
      'duration': duration,
      'ratings': ratings
    };
  }

  void addRating(double rating) {
    if (ratings.length == storedRatings) {
      ratings.removeFirst();
    }
    ratings.addLast(rating);
    averageRating = getAverageRating();
  }

  double getAverageRating() {
    if (ratings.isEmpty) {
      return -1;
    }
    double total = 0;
    for (double rating in ratings) {
      total += rating;
    }
    return total / ratings.length;
  }

  void toggleActivityFavorite() {
    favorite = !favorite;
  }
}
