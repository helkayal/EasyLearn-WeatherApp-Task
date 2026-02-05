import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static late SharedPreferences _prefs;

  static const _lastCityKey = 'last_city';
  static const _cityImagesKey = 'city_images';
  static const _maxCities = 5;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /* ---------------- Last City ---------------- */

  static Future<void> saveLastCity(String city) async {
    await _prefs.setString(_lastCityKey, city);
  }

  static String? getLastCity() {
    return _prefs.getString(_lastCityKey);
  }

  /* ---------------- City Images (MAX 5, ORDERED) ---------------- */

  static Future<void> saveCityImage({
    required String city,
    required String imageUrl,
  }) async {
    final raw = _prefs.getString(_cityImagesKey);

    List<Map<String, dynamic>> list = raw != null
        ? List<Map<String, dynamic>>.from(jsonDecode(raw))
        : [];

    /// 1️⃣ Remove existing city (case-insensitive)
    list.removeWhere(
      (e) => e['city'].toString().toLowerCase() == city.toLowerCase(),
    );

    /// 2️⃣ Insert at top (most recent)
    list.insert(0, {'city': city, 'image': imageUrl});

    /// 3️⃣ Keep only last _maxCities
    if (list.length > _maxCities) {
      list = list.sublist(0, _maxCities);
    }

    await _prefs.setString(_cityImagesKey, jsonEncode(list));
  }

  static String? getCityImage(String city) {
    final raw = _prefs.getString(_cityImagesKey);
    if (raw == null) return null;

    final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      jsonDecode(raw),
    );

    final match = list.firstWhere(
      (e) => e['city'].toString().toLowerCase() == city.toLowerCase(),
      orElse: () => {},
    );

    return match['image'] as String?;
  }

  static List<String> getSavedCities() {
    final raw = _prefs.getString(_cityImagesKey);
    if (raw == null) return [];

    final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      jsonDecode(raw),
    );

    return list.map((e) => e['city'] as String).toList();
  }

  static Future<void> clearCityImages() async {
    await _prefs.remove(_cityImagesKey);
  }

  static Future<void> deleteCity(String city) async {
    final raw = _prefs.getString(_cityImagesKey);
    if (raw == null) return;

    List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      jsonDecode(raw),
    );

    list.removeWhere(
      (e) => e['city'].toString().toLowerCase() == city.toLowerCase(),
    );

    await _prefs.setString(_cityImagesKey, jsonEncode(list));

    /// If deleted city was last city → clear it
    final lastCity = getLastCity();
    if (lastCity?.toLowerCase() == city.toLowerCase()) {
      await _prefs.remove(_lastCityKey);
    }
  }

  /* ---------------- Debug Helper ---------------- */

  static Map<String, dynamic> getAll() {
    final keys = _prefs.getKeys();
    final Map<String, dynamic> data = {};

    for (final key in keys) {
      data[key] = _prefs.get(key);
    }

    return data;
  }
}
