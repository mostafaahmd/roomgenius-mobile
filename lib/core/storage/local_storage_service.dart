import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> writeString(String key, String value);
  Future<void> writeBool(String key, bool value);
  Future<void> writeInt(String key, int value);
  Future<void> writeDouble(String key, double value);
  Future<void> writeStringList(String key, List<String> value);

  Future<String?> readString(String key);
  Future<bool?> readBool(String key);
  Future<int?> readInt(String key);
  Future<double?> readDouble(String key);
  Future<List<String>?> readStringList(String key);

  Future<void> remove(String key);
  Future<void> clear();
}

class SharedPreferencesLocalStorageService implements LocalStorageService {
  const SharedPreferencesLocalStorageService();

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  @override
  Future<bool?> readBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  @override
  Future<double?> readDouble(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(key);
  }

  @override
  Future<int?> readInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  @override
  Future<String?> readString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<List<String>?> readStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key);
  }

  @override
  Future<void> writeBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  @override
  Future<void> writeDouble(String key, double value) async {
    final prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  @override
  Future<void> writeInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  @override
  Future<void> writeString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<void> writeStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    await prefs.setStringList(key, value);
  }
}
