# ReliefLink

## About the Project

A companion for individuals struggling with thoughts of harming themselves.

An app to assist suicide prevention, from coping techniques to relaxation exercises. Part of the Junior Design class at Georgia Tech, group 2136, with our client Dr. Nadine Kaslow.

## Team Members

- Eduardo Trunci
- Daniel Young
- Alexandr Shor
- Yuting Shen
- Suvan Adhikari
- Rithvik Rajavelu

## The Design
We had some awesome people thinking on how to make this app look good. The process is still ongoing! Here a snippet of it:

[Link to Figma](https://www.figma.com/file/mNFVtgz74QbCJ8LsecEXef/2136-Prototype---ReliefLink?node-id=0%3A1)

### Screenshots
Soon!


# Installation Guide

## For programmers

This app was entirely built on Flutter. Since there is not back-end to it, its deployment is the creation of the APK for Android and iOS devices and its addition to the app stores.

To run it locally, one needs to:

1. [Install Flutter](https://docs.flutter.dev/get-started/install)
2. Clone this repository
3. [Create an account on the Google Cloud](https://cloud.google.com/resource-manager/docs/creating-managing-projects), as well as a project.
4. [Create a new API Key for the Google Maps API](https://developers.google.com/maps/documentation/javascript/get-api-key).
5. Add the API Key in [this file](https://github.com/AlexShor0103/Team-2136-ReliefLink/blob/main/web/index.html#L34) and in [this file](https://github.com/AlexShor0103/Team-2136-ReliefLink/blob/main/android/app/src/main/AndroidManifest.xml#L36).
6. On the main directory, run `flutter run` and choose a device to run it on

There are some dependencies for this project. They are automatically installed on the `flutter run` command, but here they are:

```
  chewie: ^1.3.5
  video_player: ^2.4.7
  dio: ^4.0.0
  flutter_polyline_points: ^0.2.6
  google_maps_flutter: ^2.0.2
  google_maps_flutter_web: ^0.3.2+2
  url_launcher:
  store_redirect: ^2.0.1
  overlay_support: ^1.0.0
  cupertino_icons: ^1.0.2
  shared_preferences: ^2.0.15
  fl_chart: ^0.55.2
  pie_chart: ^5.3.2
  syncfusion_flutter_charts: ^20.3.59
```

This is enough to run the project locally and in any connected Android device, as long as it is on developer mode. To build it for the Google App Store, [this tutorial](https://docs.flutter.dev/deployment/android) should do it. This is the [tutorial for iOS](https://docs.flutter.dev/deployment/ios).

For demo purposes, we suggest you to deploy the Flutter app to Firebase - so that people can open in on their phone's browsers. If you do so, update the link in the next section. Here is a guide for doing it: [Guide](https://medium.com/flutter/must-try-use-firebase-to-host-your-flutter-app-on-the-web-852ee533a469).

## For non-programmers

We suggest that you speak to the programmers on your team. You can try this link, too: [Link](https://relieflink.trunci.com/). It might contain a working version of the deployed app for your phone!


# Release Notes

## v0.1.0

### Features

- Activities sorting on the home screen is enabled by favorites, mood or duration
- Favoriting is enabled on the home screen (as well as in the evaluation screen)
- Profile screen available, to add personal information and Health Insurance information

### Bug Fixes

- Sorting in Home Page now works and only one sorting option can be selected at a time

### Known Issues

- Some titles of activities get broken down and overflow in the cards due to the cards being too small
- Favoriting an activity resets when the app is closed
- Favorite Icon overflows on some Relief Technique cards



## v0.2.0

### Features

- Activities search on the home screen is enabled
- Ability to access the favorite activities from the navigation bar
- Settings tab created, where you can access the profile page and recommended external coping techniques (such as other apps)
- Personal information is now stored in the device (and not lost when closing the app)
- The ability to search for health resources in the area is now available!


### Bug Fixes

- Overflow of the cards is fixed, as well as all overflows in icons
- Information in the personal profile is now persistent accress sessions

### Known Issues

- Favoriting an acitivity when looking at the favorites tab in the home screen does not update instantly
- Favoriting an activity resets when the app is closed
- Buggy formatting of settings tab and external coping activities
- Map API is not using the user's current location


## v0.3.0


### Features

- Find mental health clinics near me
  - Users can now search the map to find health resources near them
- Add and reach out to Emergency Contacts
  - Emergency contacts can be saved to the app, with the ability to call or text them
-  Access to external suggestions of resources
   -  A curated list of apps and services that can assist the users, on top of our own features, can be found in the app now. That includes breathing exercises, relaxation and meditation apps


### Bug Fixes

- Profile tab is no longer breaking when accessed through the menu bar
- Map API now works on all devices
- Favoriting an acitivity is now consistent across sessions

### Known Issues

- Inconsistent tabbing of elements in the "Relation" field in Emergency Contact cards
- Map API is not using the user's current location
- Favoriting an acitivity when looking at the favorites tab in the home screen does not update instantly
- Buggy formatting of settings tab, with the Profile, Maps and External Coping Activities tab

## v0.4.0


### Features

- Crisis Plan
  - Users can now add their own crisis plan and access when needed
  - The plan's structured was carefully indicated to us by our clients over from Emory University
- Onboarding is available for new users
  - New users can now go through a tutorial of the screens on the first time they open the app, or skip it
  - They can revisit it in the future if needed
-  New sorting and organizing features
   - On the relief techniques page, cards can be sorted by ratings now
   - Card's categories by which they were sorted also available on the sorted screen


### Bug Fixes

- Fixed inconsistent tabbing of elements in the "Relation" field in Emergency Contact cards
- Favoriting an acitivity when looking at the favorites tab in the home screen now updates instantly
- Correct formatting of settings tab
- Recommendations screen now fully revamped
- Several color and style fixes across the app

### Known Issues

- Map API is not using the user's current location
- Relief Technique cards overflow in some devices
- Onboarding flow not popping up upon first start of app

## v1.0

The first public deployment of the app!

### Features

- Users can edit the Relief Techniques
  - They can add, remove and edit the relief techniques present in the app to their liking!
- Journaling
  - Users now have a space to write down how their are feeling and keep track of their trends
- Restyled Emergency Button
  - Which will now call 988
- Likert-scale based activity rating
  - Users can now use a Likert scale to rate the relieft activity completed
- Overall design changes
  - Cleaner and more intuitive UI, with consistent colors and patterns

### Bug Fixes
- Relief Technique cards overflow in some devices has been fixed
- Relief Technique's video will pause after exiting the page
- Top bar will now update according to the screen the user is in
- Crisis screen now shows as a page, not a pop up

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Mood chart overflow on Chrome
