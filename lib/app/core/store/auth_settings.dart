import 'package:shared_preferences/shared_preferences.dart';

class AuthSettings {
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  Future<void> setUserToken(String token) async {
    final prefs = await this.prefs;
    await prefs.setString('token', token);
  }

  Future<String?> getUserToken() async {
    final prefs = await this.prefs;
    return prefs.getString('token');
  }

  Future<void> clearUserToken() async {
    final prefs = await this.prefs;
    await prefs.remove('token');
  }
}
