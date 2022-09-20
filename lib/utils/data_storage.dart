import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './emergency_contact_utils.dart';

class DataStorage {
  SharedPreferences? prefs;
  Map<String, dynamic>? data;

  Future<void> init() async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      Set<String> keys = prefs!.getKeys();
      Map<String, dynamic> newData = {};
      for (String key in keys) {
        newData[key] = prefs!.get(key);
      }
      data = newData;
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  bool setPair(String key, dynamic value) {
    try {
      data![key] = value;
      return true;
    } catch(e) {
      // If init hasn't run yet - could be a race condition
      return false;
    }
  }

  // shared_preferences does not allow objects as values
  // Things we need to store: emergency contacts, personal info,
  // relief technique ratings and favorites, and maybe more stuff

  // Key for list of emergency contact ids, personal info ids,
  // relief technique ids, etc. start with applist_{NAME}

  bool addEmergencyContact(EmergencyContactData contactData) {
    try {
      List<String> contactsList = data!['applist_contacts'];
      contactsList.add(contactData.id);
      setPair("applist_contacts", contactsList);
      setPair("contact_" + contactData.id, jsonEncode(contactData));
      return true;
    } catch(e) {
      return false;
    }
  }

  dynamic getValue(String key) {
    try {
      return data!['key'];
    } catch(e) {
      return null;
    }
  }

  Map<String, dynamic>? getData() {
    return data;
  }

  bool saveToDisk() {
    try {
      for (String key in data!.keys) {
        dynamic value = data![key];
        if (value is String) {
          prefs!.setString(key, value);
        } else if (value is int) {
          prefs!.setInt(key, value);
        } else if (value is double) {
          prefs!.setDouble(key, value);
        } else if (value is bool) {
          prefs!.setBool(key, value);
        } else if (value is List<String>) {
          prefs!.setStringList(key, value);
        }
      }
      return true;
    } catch(e) {
      return false;
    }
  }
}