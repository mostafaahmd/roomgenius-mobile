import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static Future<void> removeData(String key) async {
    AppLogger.debug('SharedPrefHelper.removeData($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    AppLogger.debug('SharedPrefHelper.clearAllData()');
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<void> setData(String key, dynamic value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    AppLogger.debug('SharedPrefHelper.setData($key)');

    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value as String);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value as int);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value as bool);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value as double);
        break;
      default:
        throw UnsupportedError(
          'SharedPrefHelper.setData does not support ${value.runtimeType}',
        );
    }
  }

  static Future<bool> getBool(String key) async {
    AppLogger.debug('SharedPrefHelper.getBool($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    AppLogger.debug('SharedPrefHelper.getDouble($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    AppLogger.debug('SharedPrefHelper.getInt($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    AppLogger.debug('SharedPrefHelper.getString($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<List<String>> getStringList(String key) async {
    AppLogger.debug('SharedPrefHelper.getStringList($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key) ?? <String>[];
  }

  static Future<void> setStringList(String key, List<String> value) async {
    AppLogger.debug('SharedPrefHelper.setStringList($key)');
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, value);
  }

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    AppLogger.debug('FlutterSecureStorage.write($key)');
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    AppLogger.debug('FlutterSecureStorage.read($key)');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> clearAllSecuredData() async {
    AppLogger.debug('FlutterSecureStorage.deleteAll()');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
