import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  SharedPreferences? prefs;
  Map<String, dynamic>? data;

  Future<bool> setPair(String key, dynamic value) async {
    try {
      prefs ??= await SharedPreferences.getInstance();
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
      } else {
        throw ArgumentError("SharedPreferences does not allow type " + value.runtimeType.toString());
      }
      updateData();
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
    return true;
  }

  Future<void> updateData() async {
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

  // shared_preferences does not allow objects as values
  // Things we need to store: emergency contacts, personal info,
  // relief technique ratings and favorites, and maybe more stuff

  // Key for list of emergency contact ids, personal info ids,
  // relief technique ids, etc. start with applist_{NAME}
}