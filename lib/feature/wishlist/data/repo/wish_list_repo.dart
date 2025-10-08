import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class WishListRepo {
  static Future<Response?> getwishList() async {
    try {
      Response wishlistRes = await MyDioProvider.get(
        endpoint: MyEndPoints.showWishlist,
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return wishlistRes;
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }


  static Future<Response?> addTOWishList() async {
    try {
      Response wishlistRes = await MyDioProvider.post(
        endpoint: MyEndPoints.showWishlist,
        
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return wishlistRes;
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }
  static Future<Response?> removeFromWishlist() async {
    try {
      Response wishlistRes = await MyDioProvider.delete(
        endpoint: MyEndPoints.showWishlist,
      );
      if (wishlistRes.statusCode == 200 || wishlistRes.statusCode == 201) {
        return wishlistRes;
      } else {
        return null;
      }
    } on Dio catch (e) {
      log(e.toString());
      return null;
    }
  }
}
