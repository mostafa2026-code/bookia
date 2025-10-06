import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/auth/data/model/my_auth_r_esponse/my_auth_r_esponse.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:dio/dio.dart';

class MyAuthRepo {
  static Future<MyAuthREsponse?> register(AuthParams params) async {
    try {
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.register,
        body: params.fromObjectToJson(),
      );

      if (myRes.statusCode == 201) {
        return MyAuthREsponse.fromJson(myRes.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<MyAuthREsponse?> login(AuthParams params) async {
    try {
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.login,
        body: params.fromObjectToJson(),
      );
      if (myRes.statusCode == 200) {
        return MyAuthREsponse.fromJson(myRes.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<MyAuthREsponse?> forgetPassword(AuthParams params) async {
    try {
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.sendForgetPasswordLink,
        body: params.fromObjectToJson(),
      );
      if (myRes.statusCode == 200 || myRes.statusCode == 201) {
        return MyAuthREsponse.fromJson(myRes.data);
      } else {
        log("Unexpected status code: ${myRes.statusCode}");
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response> checkForgetPassword() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.checkForgetPasswordCodes,
      body: {"email": "sayed123@gmail.com", "verify_code": 837178},
    );
    return myRes;
  }

  static Future<Response?> resetPassword(AuthParams params) async {
    try {
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.resetPassword,
        body: params.fromObjectToJson(),
      );
      if (myRes.statusCode == 200) {
        return myRes;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
