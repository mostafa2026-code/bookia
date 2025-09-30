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
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> register() async {
    emit(AuthLoadingState());
    MyAuthREsponse? registerResponse = await MyAuthRepo.register(
      AuthParams(
        username: namecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmPassword: confirmpasswordcontroller.text,
      ),
    );
    if (registerResponse != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  void login() async {
    emit(AuthLoadingState());

    MyAuthREsponse? loginResponse = await MyAuthRepo.login(
      AuthParams(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      ),
    );
    if (loginResponse != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  void forgetPassword() async {
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
