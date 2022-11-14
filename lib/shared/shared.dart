import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();
  static SharedPrefs get instance => _instance;

  late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> remove(String key) async => await _prefs.remove(key);

  Future<void> clear() async => await _prefs.clear();

  /// Setters
  Future<bool> setToken(String value) async =>
      await _prefs.setString('authtoken', value);
  Future<bool> setUserId(int value) async =>
      await _prefs.setInt('userId', value);

  /// Getters
  String? getToken() => _prefs.getString('authtoken');
  int? getUserId() => _prefs.getInt('userId');
}
