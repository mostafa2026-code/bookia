import 'dart:convert';

import 'package:bookia/feature/auth/data/model/login/login_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> clear() async {
    sharedPreferences!.clear();
  }

  static void saveUserData(User user) {
    // ignore: unrelated_type_equality_checks
    if (User == user) return;
    Map<String, dynamic> userMap = user.toJson();
    String userString = jsonEncode(userMap);
    sharedPreferences!.setString("userData", userString);
  }

  static User? getUserData() {
    String? userString = sharedPreferences!.getString("userData");
    if (userString == null || userString.isEmpty) {
      return null;
    }

    Map<String, dynamic> userMap = jsonDecode(userString);
    return User.fromJson(userMap);
  }

  static void removeUserData() {
    sharedPreferences!.remove("userData");
  }

  static void saveToken(String token) {
    sharedPreferences!.setString("token", token);
  }

  static String getToken() {
    return sharedPreferences!.getString("token") ?? "";
  }

  static void removeToken() {
    sharedPreferences!.remove("token");
  }

  static void saveImage(String image) {
    sharedPreferences!.setString("image", image);
  }

  static String? getimage() {
    return sharedPreferences!.getString("image");
  }
}
