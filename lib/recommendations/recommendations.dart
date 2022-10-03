import 'package:flutter/material.dart';
import '../recommendations/recommendation_panel.dart';

List<RecommendationPanel> recommendations = [
  RecommendationPanel(
    icon: const Icon(Icons.downhill_skiing,),
    title: 'Mood Mission',
    description: 'Some users liked the simplicity and color palette. However, it is a paid app.'),
  RecommendationPanel(
    icon: const Icon(Icons.park,),
    title: 'Calm',
    description: 'Some users liked the milestone system and the guided meditation. However, it is a paid app.'),
  RecommendationPanel(
    icon: const Icon(Icons.self_improvement,),
    title: 'Headspace',
    description: 'Some users liked the flow and interactivity of it. However, it is a paid app.'),
  RecommendationPanel(
    icon: const Icon(Icons.waving_hand,),
    title: 'notOK',
    description: 'Some users liked that the app helps you know what to say. May not work on all phones.'),
  RecommendationPanel(
    icon: const Icon(Icons.waves,),
    title: 'Calm Harm',
    description: 'Some users liked the skills it taught and the activity suggestion, but found the password frustrating.'),
  RecommendationPanel(
    icon: const Icon(Icons.wb_cloudy,),
    title: 'Suicide Safe',
    description: 'Some users liked that it helped them help others and could find local clinics. May not be inclusive for all users.'),
  RecommendationPanel(
    icon: const Icon(Icons.wb_sunny_outlined,),
    title: 'Virtual Hope Box',
    description: 'Some users liked the variability and different modes, but found the password frustrating.'),
];

