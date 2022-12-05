import 'package:flutter/cupertino.dart';
class RecommendationPanel {
  String title;
  String description;
  String androidAppId;
  String iOSAppId;
  String webUrl;

  RecommendationPanel(
    {required this.title,
    required this.description,
    required this.androidAppId,
    required this.iOSAppId,
    required this.webUrl});
}