import 'package:shared_preferences/shared_preferences.dart';

import '../utlis/constants.dart';

class StorageService {
  late SharedPreferences _prefs;

  void initStorageService() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void updateStorage(List<(String, dynamic)> values) {
    for (var element in values) {
      final String key = element.$1;
      final dynamic value = element.$2;

      if (value is String) {
        _setStorageString(key, value);
      } else if (value is bool) {
        _setStorageBool(key, value);
      } else if (value is List<String>) {
        _setStorageList(key, value);
      } else if (value is List<dynamic>) {
        _setStorageList(key, value.map((el) => el.toString()).toList());
      } else if (value == null) {
        continue;
      } else {
        throw const FormatException('Invalid value type.');
      }
    }
  }

  void removeStorage() {
    _removeStorageKey(usernameStorageKey);
    _removeStorageKey(loggedInStorageKey);
    _removeStorageKey(photosStorageKey);
  }

  void _setStorageString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  void _setStorageBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  void _setStorageList(String key, List<String> values) async {
    await _prefs.setStringList(key, values);
  }

  String? getStorageString(String key) {
    return _prefs.getString(key);
  }

  bool? getStorageBool(String key) {
    return _prefs.getBool(key);
  }

  List<String>? getStorageList(String key) {
    return _prefs.getStringList(key);
  }

  void _removeStorageKey(String key) async {
    await _prefs.remove(key);
  }
}
