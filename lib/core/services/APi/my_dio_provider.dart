import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class MyDioProvider {
  static late Dio myDio;

  static String? token = "9933|spFzxhZc55oAo4h057kGRvYG13TzMuFRShjjFuRE";

  static void init() {
    myDio = Dio(
      BaseOptions(
        baseUrl: MyEndPoints.baseUrl,
        sendTimeout: Duration(seconds: 20),
        connectTimeout: Duration(seconds: 20),
      ),
    );
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
