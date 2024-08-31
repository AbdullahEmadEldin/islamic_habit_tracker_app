import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _instance.setString(key, value);
    if (value is int) return await _instance.setInt(key, value);
    if (value is bool) return await _instance.setBool(key, value);
    return await _instance.setDouble(key, value);
  }

  static dynamic getData({required String key}) => _instance.get(key);

  static Future<bool> removeData({
    required String key,
  }) async {
    return await _instance.remove(key);
  }

  static Future<bool> clearData() async {
    return await _instance.clear();
  }

  static Future<bool> containsKey({
    required String key,
  }) async {
    return _instance.containsKey(key);
  }
}
