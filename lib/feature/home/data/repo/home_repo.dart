import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/feature/home/data/model/home_response/home_response.dart';
import 'package:dio/dio.dart';


class HomeRepo {
  static Future<HomeResponse?> bestSellerBooks() async {
    try {
      Response bestsellerer = await MyDioProvider.get(
        endpoint: MyEndPoints.bestSellers,
      );
      HomeResponse homeResponse = HomeResponse.fromJson(bestsellerer.data);
      if (bestsellerer.statusCode == 200) {
        return homeResponse;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
