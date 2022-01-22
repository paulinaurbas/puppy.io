import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String isUserLogIn = 'IS_USER_LOG_IN';
  static const String email = 'EMAIL';
  static const String userName = 'USER_NAME';
  static const String userPassword = 'USER_PASSWORD';

}

extension SettingAndGettingValues on SharedPreferencesHelper {
  Future setStringPreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool> setBoolPreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);

    return true;
  }

  void setDoublePreference(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<String?> getStringPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  Future<bool?> getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key);
  }

  Future<double?> getDoublePreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(key);
  }
}
