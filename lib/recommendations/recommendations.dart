import 'package:flutter/material.dart';
import '../recommendations/recommendation_panel.dart';

List<RecommendationPanel> recommendations = [
  RecommendationPanel(
    title: 'Mood Mission',
    description: 'Some users liked the simplicity and color palette. However, it is a paid app.',
    androidAppId: 'au.com.mood.mission',
    iOSAppId: '1140332763'),
  RecommendationPanel(
    title: 'Calm',
    description: 'Some users liked the milestone system and the guided meditation. However, it is a paid app.',
    androidAppId: 'com.calm.android',
    iOSAppId: '571800810'),
  RecommendationPanel(
    title: 'Headspace',
    description: 'Some users liked the flow and interactivity of it. However, it is a paid app.',
    androidAppId: 'com.getsomeheadspace.android',
    iOSAppId: '493145008'),
  RecommendationPanel(
    title: 'notOK',
    description: 'Some users liked that the app helps you know what to say. May not work on all phones.',
    androidAppId: 'com.robinlucas.notok',
    iOSAppId: '1322629109'),
  RecommendationPanel(
    title: 'Calm Harm',
    description: 'Some users liked the skills it taught and the activity suggestion, but found the password frustrating.',
    androidAppId: 'uk.org.stem4.calmharm',
    iOSAppId: '961611581'),
  RecommendationPanel(
    title: 'Suicide Safe',
    description: 'Some users liked that it helped them help others and could find local clinics. May not be inclusive for all users.',
    androidAppId: 'gov.hhs.samhsa.app.spa',
    iOSAppId: '968468139'),
  RecommendationPanel(
    title: 'Virtual Hope Box',
    description: 'Some users liked the variability and different modes, but found the password frustrating.',
    androidAppId: 'com.t2.vhb',
    iOSAppId: '825099621'),
];

