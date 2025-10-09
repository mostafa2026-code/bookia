import 'package:bookia/feature/auth/data/model/login/login_response/login_response.dart';
import 'package:bookia/feature/auth/data/model/my_auth_r_esponse/my_auth_r_esponse.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/my_auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController loginemailcontroller = TextEditingController();
  final TextEditingController loginpasswordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    emit(AuthLoadingState());
    try {
      MyAuthREsponse? registerResponse = await MyAuthRepo.register(
        AuthParams(
          username: namecontroller.text.trim(),
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
          confirmPassword: confirmpasswordcontroller.text.trim(),
        ),
      );

      if (registerResponse != null) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState('Registration failed. Please check your details.'));
      }
    } catch (e) {
      emit(AuthErrorState('Unexpected error: $e'));
    }
  }

  Future<void> login() async {
    if (!loginformKey.currentState!.validate()) return;

    emit(AuthLoadingState());

    LoginResponse? loginResponse = await MyAuthRepo.login(
      AuthParams(
        email: loginemailcontroller.text.trim(),
        password: loginpasswordcontroller.text.trim(),
      ),
    );
    if (loginResponse != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('log in failed '));
    }
  }

  //   void forgetPassword() async {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void resetPassword() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void otpVerification() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void logOut() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void cheeckForgetPassword() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void resendVerifyLink() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  //   void verifyEmail() {
  //     emit(AuthLoadingState());

  //     emit(AuthSuccessState());

  //     emit(AuthErrorState());
  //   }

  // }
}

// static Future<MyAuthREsponse?> register(AuthParams params) async {
//   try {
//     Response myRes = await MyDioProvider.post(
//       endpoint: MyEndPoints.register,
//       body: params.fromObjectToJson(),
//     );

//     // السماح بكل success codes الممكنة

// }
