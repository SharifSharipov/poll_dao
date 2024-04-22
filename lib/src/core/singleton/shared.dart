import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> saveString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  static Future<bool> saveDouble(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key);
  }

  static Future<bool> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  static Future<bool> saveObject<T>(String key, T value) async {
    final SharedPreferences prefs = await _prefs;
    String jsonValue = json.encode(value);
    return prefs.setString(key, jsonValue);
  }

  static Future<T?> getObject<T>(String key) async {
    final SharedPreferences prefs = await _prefs;
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString) as T;
    }
    return null;
  }

  static Future<bool> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}
