import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './emergency_contact_utils.dart';

class DataStorage {
  SharedPreferences? prefs;
  Map<String, dynamic>? data;

  /// Initializes the local storage instance and updates the local copy of data.
  /// This function should be run before using a DataStorage object.
  /// Beware of race conditions.
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

  /// Sets a key-value pair in the local copy of the data store, with [key] and [value].
  /// Better not to use this directly, but use the abstracted methods for each type
  /// of stored data.
  /// Returns true if the pair is successfully set, false otherwise.
  /// Check to make sure init() has been called if false is returned.
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

  /// Adds an emergency contact object [contactData] to the local copy of the data store.
  /// Returns true if the pair is successfully set, false otherwise.
  /// Check to make sure init() has been called if false is returned.
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
  /// Gets a value corresponding to a [key] in the local copy of the
  /// key-value store.
  /// If there is an error getting the data, returns null. Check to make sure init()
  /// has been called.
  dynamic getValue(String key) {
    try {
      return data!['key'];
    } catch(e) {
      return null;
    }
  }

  /// Gets the class for the data of an emergency contact from the local copy, given an [id].
  /// If the emergency contact is not in the local copy or an error occurs, null is returned.
  /// Check to make sure init() has been called.
  EmergencyContactData? getEmergencyContact(String id) {
    try {
      return EmergencyContactData.fromJson(
          jsonDecode(getValue("contact_" + id)));
    } catch (e) {
      return null;
    }
  }

  /// Gets the local copy of the entire key-value store. Does NOT return a copy
  /// of the data, but a reference to the local copy of the data.
  /// If the data is null, make sure init() has been called.
  Map<String, dynamic>? getData() {
    return data;
  }

  /// Saves the local copy of the data to disk.
  /// Returns true if the data is successfully saved, false otherwise.
  /// If false is returned, make sure init() has been called.
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