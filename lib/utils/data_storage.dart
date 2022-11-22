import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './emergency_contact_utils.dart';
import './user_account_utils.dart';
import '../activities/activities.dart';
import 'package:relieflink/utils/crisis_data_utils.dart';

class DataStorage {
  static SharedPreferences? prefs;
  static Map<String, dynamic>? data;

  /// Initializes the local storage instance and updates the local copy of data.
  /// This function should be run before using a DataStorage object.
  /// Beware of async bugs.
  /// Returns true if successful, false if unsuccessful
  static Future<bool> init() async {
    try {
      if (prefs == null) {
        prefs = await SharedPreferences.getInstance();
        Set<String> keys = prefs!.getKeys();
        Map<String, dynamic> newData = {};
        for (String key in keys) {
          newData[key] = prefs!.get(key);
        }
        data = newData;
        setDefaultData();
        saveToDisk();
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  static bool setDefaultData() {
    if (data == null) {
      return false;
    }
    if (!data!.containsKey("applist_contacts")) {
      setPair("applist_contacts", List<String>.empty(growable: true));
    }
    if (!data!.containsKey("account_data")) {
      setUserAccountData(UserAccountData.blankAccount());
    }
    if (!data!.containsKey("crisis_data")) {
      setCrisisData(CrisisData.blankAccount());
    }
    if (!data!.containsKey("applist_relief")) {
      List<String> activityNames = List<String>.empty(growable: true);
      for (ReliefTechniqueData activityData in activities) {
        activityNames.add(activityData.activityName);
        setPair(
            "relief_" + activityData.activityName, jsonEncode(activityData));
      }
      setPair("applist_relief", activityNames);
    }
    return true;
  }

  /// Sets a key-value pair in the local copy of the data store, with [key] and [value].
  /// Better not to use this directly, but use the abstracted methods for each type
  /// of stored data.
  /// Returns true if the pair is successfully set, false otherwise.
  /// Check to make sure init() has been called if false is returned.
  static bool setPair(String key, dynamic value) {
    try {
      data![key] = value;
      return true;
    } catch (e) {
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
  static bool addEmergencyContact(EmergencyContactData contactData) {
    try {
      List<String> contactsList = data!['applist_contacts'];
      contactsList.add(contactData.id);
      contactsList = contactsList.toSet().toList();
      setPair("applist_contacts", contactsList);
      setPair("contact_" + contactData.id, jsonEncode(contactData));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Removes an emergency contact object [contactData] from the local copy of the data store.
  /// Returns true if the pair is successfully removed, false otherwise.
  /// Check to make sure init() has been called if false is returned.
  static bool removeEmergencyContact(String id) {
    try {
      List<String> contactsList = data!['applist_contacts'];
      contactsList.remove(id);
      contactsList = contactsList.toSet().toList();

      setPair("applist_contacts", contactsList);
      data!.remove('contact_' + id);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Removes an relief technique object [reliefTechnique] from the local copy of the data store.
  /// Returns true if the pair is successfully removed, false otherwise.
  /// Check to make sure init() has been called if false is returned.
  static bool removeReliefTechnique(String name) {
    try {
      List<String> reliefList = data!['applist_relief'];
      reliefList.remove(name);
      reliefList = reliefList.toSet().toList();

      setPair("applist_relief", reliefList);
      data!.remove('relief_' + name);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Adds or update a user account object [accountData] to the local copy of the data store.
  /// Returns true if the pair is successfully set, false otherwise.
  /// Check to make sure init() has been called if false is returned.
  static bool setUserAccountData(UserAccountData accountData) {
    try {
      setPair("account_data", jsonEncode(accountData));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Adds or updates a crisis data object [crisisData] to the local copy of the data store.
  /// returns true if the pair is successfully set, false otherwise.
  /// Check to make sure init() has been called if false is returned.
  static bool setCrisisData(CrisisData crisisData) {
    try {
      setPair("crisis_data", jsonEncode(crisisData));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Updates the data for a relief technique, given relief technique data [techniqueData].
  /// If the technique does not already exist, creates it
  /// Returns true if successful, false otherwise
  static bool updateReliefTechniqueData(ReliefTechniqueData techniqueData) {
    try {
      List<String> reliefList = data!['applist_relief'];
      reliefList.add(techniqueData.activityName);
      reliefList = reliefList.toSet().toList();

      setPair("applist_relief", reliefList);
      setPair(
          "relief_" + techniqueData.activityName, jsonEncode(techniqueData));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Gets a value corresponding to a [key] in the local copy of the
  /// key-value store.
  /// If there is an error getting the data, returns null. Check to make sure init()
  /// has been called.
  static dynamic getValue(String key) {
    try {
      return data![key];
    } catch (e) {
      return null;
    }
  }

  /// Gets the class for the data of an emergency contact from the local copy, given an [id].
  /// If the emergency contact is not in the local copy or an error occurs, null is returned.
  /// Check to make sure init() has been called.
  static EmergencyContactData? getEmergencyContact(String id) {
    try {
      return EmergencyContactData.fromJson(
          jsonDecode(getValue("contact_" + id)));
    } catch (e) {
      return null;
    }
  }

  /// Gets the class for the data of user account from the local copy.
  /// If the user account is not in the local copy or an error occurs, null is returned.
  /// Check to make sure init() has been called.
  static UserAccountData? getUserAccountData() {
    try {
      return UserAccountData.fromJson(jsonDecode(getValue("account_data")));
    } catch (e) {
      return null;
    }
  }

  /// Gets the class for the data of a crisis plan from the local copy.
  /// If a crisis plan is not in the local copy or an error occurs, null is returned.
  /// Check to make sure init() has been called.
  static CrisisData? getCrisisData() {
    try {
      return CrisisData.fromJson(jsonDecode(getValue("crisis_data")));
    } catch (e) {
      return null;
    }
  }

  /// Gets the class for the data of a relief technique from the local copy.
  /// If a relief technique of the given name is not in the local copy or an error occurs, null is returned.
  /// Make sure init() has been called.
  static ReliefTechniqueData? getReliefTechniqueData(String activityName) {
    try {
      return ReliefTechniqueData.fromJson(
          jsonDecode(getValue("relief_" + activityName)));
    } catch (e) {
      return null;
    }
  }

  static List<ReliefTechniqueData>? getReliefTechniqueDataList() {
    try {
      List reliefList = getValue("applist_relief");
      List<ReliefTechniqueData> dataList = List.empty(growable: true);
      for (String name in reliefList) {
        dataList.add(getReliefTechniqueData(name)!);
      }
      return dataList;
    } catch (e) {
      return null;
    }
  }

  /// Gets the local copy of the entire key-value store. Does NOT return a copy
  /// of the data, but a reference to the local copy of the data.
  /// If the data is null, make sure init() has been called.
  static Map<String, dynamic>? getData() {
    return data;
  }

  /// Saves the local copy of the data to disk.
  /// Returns true if the data is successfully saved, false otherwise.
  /// If false is returned, make sure init() has been called.
  static bool saveToDisk() {
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
    } catch (e) {
      return false;
    }
  }
}
