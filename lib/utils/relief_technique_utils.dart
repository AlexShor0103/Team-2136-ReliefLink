import 'dart:collection';

class ReliefTechniqueData {
  static const int storedRatings = 10;
  String videoLink;
  String activityName;
  String mood;
  bool favorite;
  int duration;
  Queue<double> ratings;
  ReliefTechniqueData(this.videoLink,
      this.activityName,
      this.mood,
      this.favorite,
      this.duration,
      Queue<double>? ratings):
      ratings = ratings ?? Queue();

  ReliefTechniqueData.fromJson(Map<String, dynamic> json):
      videoLink = json['videoLink'],
      activityName = json['activityName'],
      mood = json['mood'],
      favorite = json['favorite'],
      duration = json['duration'],
      ratings = json['ratings'] ?? Queue();

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
  }

  double getAverageRating() {
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
