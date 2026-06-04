import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  static Future<void> saveUserId(int id) async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setInt("userId", id);
  }

  static Future<int?> getUserId() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getInt("userId");
  }

  static Future<void> logout() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();
  }
}