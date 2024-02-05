import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const _accessToken = 'AccessToken';
  static const _personID = 'PersonID';

  static Future<void> setAccessToken(String token) async {
    await _preferences.setString(_accessToken, token);
  }

  static String getAccessToken() {
    return _preferences.getString(_accessToken) ?? '';
  }

  static Future<void> setPersonID(String token) async {
    await _preferences.setString(_personID, token);
  }

  static String getPersonID() {
    return _preferences.getString(_personID) ?? '';
  }


}