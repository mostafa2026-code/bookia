import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<Response?> getAllCartItems() async {
    try {
      Response res = await MyDioProvider.get(
        endpoint: MyEndPoints.cart,
        queryParameters: {"Authorization": "Bearer ${MyDioProvider.token}"},
      );
      if (res.statusCode == 200) {
        return res;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> addTOCart(int id) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.addCart,
        queryParameters: {"Authorization": "Bearer ${MyDioProvider.token}"},
        body: {"product_id": id},
      );
      if (res.statusCode == 201 || res.statusCode == 200) {
        return res;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Response?> removeFromCart(int id) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.cart,
        queryParameters: {"Authorization": "Bearer ${MyDioProvider.token}"},
        body: {"product_id": id},
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
