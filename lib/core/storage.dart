import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences preferences;

  static initialStorage() async {
    preferences = await SharedPreferences.getInstance();
  }

  static saveString(String key, String value) {
    preferences.setString(key, value);
  }

  static getString(String key) {
    return preferences.getString(key);
  }

  static deleteStorage(String key) {
    preferences.remove(key);
  }
}
