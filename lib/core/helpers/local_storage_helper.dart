import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static late SharedPreferences _prefs;

  static const _lastCityKey = 'last_city';

  /// Init (call in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveLastCity(String city) async {
    await _prefs.setString(_lastCityKey, city);
  }

  static String? getLastCity() {
    return _prefs.getString(_lastCityKey);
  }

  static Future<void> clearLastCity() async {
    await _prefs.remove(_lastCityKey);
  }
}
