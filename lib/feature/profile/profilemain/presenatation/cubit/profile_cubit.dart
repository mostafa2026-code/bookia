import 'dart:developer';

import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/APi/my_end_points.dart';
import 'package:bookia/core/services/shared_prefrences/shared_pref.dart';
import 'package:bookia/feature/profile/profilemain/presenatation/cubit/profile_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ImagePicker imagePicker = ImagePicker();
  XFile? image;

  Future<void> pickImageFromgallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(ProfileSuccess());
    }
  }

  Future<void> pickImageFromCamera() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      emit(ProfileSuccess());
    }
  }

  Future<void> logout() async {
    // إرسال الطلب إلى السيرفر
    var response = await MyDioProvider.post(
      endpoint: MyEndPoints.logout,
      options: Options(
        headers: {"Authorization": "Bearer ${MyDioProvider.token}"},
      ),
    );

    // التحقق من نجاح العملية
    if (response.statusCode == 200) {
      log("Logout successful");
      // هنا ممكن تعمل إزالة للتوكن من التخزين
      MyDioProvider.token = null;
      SharedPref.clear();
      // أو SharedPreferences.remove("token");
    } else {
      log("Logout failed: ${response.statusCode}");
    }
  }
}
