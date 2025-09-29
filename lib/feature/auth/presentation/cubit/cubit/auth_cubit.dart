import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthStates> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  AuthCubit() : super(AuthInitialState());
  void register() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void login() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void forgetPassword() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void resetPassword() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void otpVerification() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void logOut() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void cheeckForgetPassword() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void resendVerifyLink() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }

  void verifyEmail() {
    emit(AuthLoadingState());

    emit(AuthSuccessState());

    emit(AuthErrorState());
  }
}
