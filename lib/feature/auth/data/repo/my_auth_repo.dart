import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class MyAuthRepo {
  static Future<Response> register() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.register,
      body: {
        "name": "Ahmed",
        "email": "sayed123011@gmail.com",
        "password": "12345678",
        "password_confirmation": "12345678",
      },
    );
    if (myRes.statusCode == 201) {
      return myRes;
    } else {
      throw Exception('Failed to register user');
    }
  }

  static Future<Response> login() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.login,
      body: {"email": "sayed332@gmail.com", "password": "12345678"},
    );
    return myRes;
  }

  static Future<Response> logout() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.logout,
      options: Options(
        headers: {"Authorization": "Bearer ${MyDioProvider().token}"},
      ),
    );
    return myRes;
  }

  static Future<Response> forgetPassword() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.sendForgetPasswordLink,
      body: {"email": "sayed123@gmail.com"},
    );
    return myRes;
  }

  static Future<Response> checkForgetPassword() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.checkForgetPasswordCodes,
      body: {"email": "sayed123@gmail.com", "verify_code": 837178},
    );
    return myRes;
  }

  static Future<Response> resetPassword() async {
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.resetPassword,
      body: {
        "verify_code": 837178,
        "new_password": "00000000",
        "new_password_confirmation": "00000000",
      },
    );
    return myRes;
  }
}
