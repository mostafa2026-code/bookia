import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/wishlist/data/model/response/wish_list_response/wish_list_response.dart';
import 'package:dio/dio.dart';

class WishListRepo {
  static Future<WishListResponse?> getwishList() async {
    try {
      Response wishlistRes = await MyDioProvider.get(
        endpoint: MyEndPoints.showWishlist,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return WishListResponse.fromJson(wishlistRes.data);
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> addTOWishList(int productId) async {
    try {
      Response wishlistRes = await MyDioProvider.post(
        endpoint: MyEndPoints.addToWishlist,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: {"product_id": productId},
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return WishListResponse.fromJson(wishlistRes.data);
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> removeFromWishlist(int productId) async {
    try {
      Response wishlistRes = await MyDioProvider.post(
        endpoint: MyEndPoints.removeFromWishlist,
        options: Options(
          headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
        ),
        body: {"product_id": productId},
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return WishListResponse.fromJson(wishlistRes.data);
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }
}
