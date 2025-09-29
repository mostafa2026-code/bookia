import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class MyDioProvider {
  static late Dio myDio;
  final String token = "9116|gCUeEjB2RGwAA6L03btHozxiXOV6eVATMyLsdGlQ";
  static void init() {
    myDio = Dio(BaseOptions(baseUrl: MyEndPoints.baseUrl));
  }

  static Future<Response> post({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response myRes = await myDio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return myRes;
  }

  static Future<Response> get({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response myRes = await myDio.get(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return myRes;
  }

  static Future<Response> delete({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response myRes = await myDio.delete(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return myRes;
  }

  static Future<Response> put({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response myRes = await myDio.put(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return myRes;
  }

  static Future<Response> patch({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response myRes = await myDio.patch(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return myRes;
  }
}
