
import 'dart:convert';

import 'package:bookia/feature/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences? prefs;
  static void init() async {
    prefs = await SharedPreferences.getInstance();
  }


  static void  saveUserData(UserModel ? myUser){
    if(myUser==null){
      return;
    }else{
      Map json=myUser.toJson(myUser);
      var jsonToString = jsonEncode(json);
      prefs!.setString('user', jsonToString);
    }

  }

  static UserModel? getUserData(){
    String? userString=prefs!.getString('user');
    if(userString==null){
      return null;
    }else{
      Map<String,dynamic> userMap=jsonDecode(userString);
      UserModel userModel=UserModel(
        name: userMap['name'],
        email: userMap['email'],
        password: userMap['password'],
        phone: userMap['phone'],
        image: userMap['image'],
        token: userMap['token'],
        id: userMap['id'],
      );
      return userModel;
    }
  }

  static void saveDate(String key, dynamic value) {
    if (value is int) {
      prefs!.setInt(key, value);
    } else if (value is String) {
      prefs!.setString(key, value);
    } else if (value is double) {
      prefs!.setDouble(key, value);
    } else if (value is bool) {
      prefs!.setBool(key, value);
    }
  }

  static dynamic getData(String key) {
    prefs!.get(key);
  }
  static void removeData(String key) {
    prefs!.remove(key);
  }
}
