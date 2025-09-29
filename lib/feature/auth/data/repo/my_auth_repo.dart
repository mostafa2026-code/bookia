import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:dio/dio.dart';

class MyAuthRepo {
  static Future<Response>  register() async {
   Response myRes = await MyDioProvider.post(endpoint: MyEndPoints.register, body:{
    "name" : "Ahmed",
    "email" : "sayed123011@gmail.com",
    "password":"12345678",
    "password_confirmation" :"12345678"
});
return myRes;
  
  }
}
