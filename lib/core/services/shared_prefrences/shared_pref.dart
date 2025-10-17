import 'dart:convert';

import 'package:bookia/feature/auth/data/model/login/login_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
static    SharedPreferences ?sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveUserData(User user) {
    if (User == user) return;
    Map<String, dynamic> userMap = user.toJson();
    String userString = jsonEncode(userMap);
    sharedPreferences!.setString("userData", userString);
  }

  static User getUserData() {
    String userString = sharedPreferences!.getString("userData") ?? "";
    Map<String, dynamic> userMap = jsonDecode(userString);
    User user = User.fromJson(userMap);
    return user;
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

 static  void removeToken() {
    sharedPreferences!.remove("token");
  }

}
