import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login/user_model.dart';

// class AppData {
//   static late SharedPreferences _preferences;
//
//   static Future<void> initialize() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static const _accessToken = 'AccessToken';
//   static const _personID = 'PersonID';
//
//   static Future<void> setAccessToken(String token) async {
//     await _preferences.setString(_accessToken, token);
//   }
//
//   static String getAccessToken() {
//     return _preferences.getString(_accessToken) ?? '';
//   }
//
//   static Future<void> setPersonID(String token) async {
//     await _preferences.setString(_personID, token);
//   }
//
//   static String getPersonID() {
//     return _preferences.getString(_personID) ?? '';
//   }
// }

class UserPreference {
  Future<bool> setUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setString('id', responseModel.id.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token') ?? '';
    String id = sp.getString('id')?? '';
    return UserModel(token: token, id: id);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
