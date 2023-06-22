import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static var _prefs;

  static const String dartTheme = 'dark_theme';
  static const String login = 'login';
  static const String idKoordinator = 'id_koordinator';
  static const String idPerusahaan = 'id_perusahaan';
  static const String username = 'username';
  static const String nama = 'nama';
  static const String perusahaan = 'perusahaan';

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //sets
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs.setStringList(key, value);

  //check key is exist
  static bool getExistKey(String key) => _prefs.containsKey(key);

  //gets
  static bool getBool(String key) => _prefs.getBool(key) ?? false;

  static double getDouble(String key) => _prefs.getDouble(key) ?? 0.0;

  static int getInt(String key) => _prefs.getInt(key) ?? 0;

  static String getString(String key) => _prefs.getString(key) ?? "";

  static List<String> getStringList(String key) =>
      _prefs.getStringList(key) ?? [];

  //deletes..
  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}
