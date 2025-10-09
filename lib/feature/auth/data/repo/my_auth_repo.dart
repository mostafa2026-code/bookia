import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/auth/data/model/login/login_response/login_response.dart';
import 'package:bookia/feature/auth/data/model/my_auth_r_esponse/my_auth_r_esponse.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:bookia/feature/auth/data/model/request/create_new_password_request.dart';
import 'package:dio/dio.dart';

class MyAuthRepo {
  static Future<MyAuthREsponse?> register(AuthParams params) async {
    try {
      log('Sending registration body: ${params.fromObjectToJson()}');
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.register,
        body: params.fromObjectToJson(),
      );

      if ((myRes.statusCode == 200 || myRes.statusCode == 201) &&
          myRes.data != null) {
        try {
          return MyAuthREsponse.fromJson(myRes.data);
        } catch (e) {
          log('Error parsing response: $e, data: ${myRes.data}');
          return null;
        }
      } else {
        log(
          'Registration failed with status: ${myRes.statusCode}, message: ${myRes.data}',
        );
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioError response: ${e.response!.data}');
      } else {
        log('DioError message: ${e.message}');
      }
      return null;
    } catch (e) {
      log('Unexpected error: $e');
      return null;
    }
  }

  static Future<LoginResponse?> login(AuthParams params) async {
    try {
      log('Sending registration body: ${params.fromObjectToJson()}');
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.login,
        body: params.fromObjectToJson(),
      );

      // السماح بكل success codes الممكنة
      if ((myRes.statusCode == 200 || myRes.statusCode == 201) &&
          myRes.data != null) {
        try {
          return LoginResponse.fromJson(myRes.data);
        } catch (e) {
          log('Error parsing response: $e, data: ${myRes.data}');
          return null;
        }
      } else {
        log(
          'Registration failed with status: ${myRes.statusCode}, message: ${myRes.data}',
        );
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioError response: ${e.response!.data}');
      } else {
        log('DioError message: ${e.message}');
      }
      return null;
    } catch (e) {
      log('Unexpected error: $e');
      return null;
    }
  }

  static Future<Response?> checkOtp(CreateNewPasswordRequest req) async {
    try {
      log('Sending registration body: ${req.fromObJectToJson()}');
      Response myRes = await MyDioProvider.post(
        endpoint: MyEndPoints.checkForgetPasswordCodes,
        body: req.fromObJectToJson(),
      );

      // السماح بكل success codes الممكنة
      if ((myRes.statusCode == 200 || myRes.statusCode == 201) &&
          myRes.data != null) {
        try {
          return myRes;
        } catch (e) {
          log('Error parsing response: $e, data: ${myRes.data}');
          return null;
        }
      } else {
        log(
          'Registration failed with status: ${myRes.statusCode}, message: ${myRes.data}',
        );
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioError response: ${e.response!.data}');
      } else {
        log('DioError message: ${e.message}');
      }
      return null;
    } catch (e) {
      log('Unexpected error: $e');
      return null;
    }
  }
}
