import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:dio/dio.dart';

class MyAuthRepo {
  static Future<Response> register() async {
    AuthParams authParams = AuthParams();

    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.register,
      body: authParams.fromObjectToJson(),
    );
    if (myRes.statusCode == 201) {
      return myRes;
    } else {
      throw Exception('Failed to register user');
    }
  }

  static Future<Response> login() async {
    AuthParams authParams = AuthParams();
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.login,
      body: authParams.fromObjectToJson(),
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
    AuthParams authParams = AuthParams();
    Response myRes = await MyDioProvider.post(
      endpoint: MyEndPoints.sendForgetPasswordLink,
      body: authParams.fromObjectToJson(),
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
    AuthParams authParams = AuthParams();
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
