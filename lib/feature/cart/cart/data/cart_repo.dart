import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/cart/data/model/place_request.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<CartResponse?> getAllCartItems() async {
    try {
      Response res = await MyDioProvider.get(
        endpoint: MyEndPoints.cart,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
      );
      if (res.statusCode == 200) {
        return CartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> addTOCart(int id) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.addCart,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: {"product_id": id},
      );
      if (res.statusCode == 201 || res.statusCode == 200) {
        return CartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart(int cartItemId) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.deleteCart,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: {"cart_item_id": cartItemId},
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return CartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> updateCart(int cartItemId, int quantity) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.updateCart,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: {"cart_item_id": cartItemId, "quantity": quantity},
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return CartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
  static Future<CartResponse?> placeOrder(PlaceRequest place_request) async {
    try {
      Response res = await MyDioProvider.post(
        endpoint: MyEndPoints.placeorder,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: place_request.tojson(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return CartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
