import 'package:bookia/feature/auth/data/model/login/login_response/login_response.dart';
import 'package:bookia/feature/auth/data/model/my_auth_r_esponse/my_auth_r_esponse.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:bookia/feature/auth/data/model/request/create_new_password_request.dart';
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
  final TextEditingController foregtpasswordemailcontroller =
      TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  final TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetpasswordformKey = GlobalKey<FormState>();
  bool issecured = true;
  bool issecuresconfirm = true;
  void changesec() {
    issecured = !issecured;
  }

  void conchangesec() {
    issecuresconfirm = !issecuresconfirm;
  }

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

  Future<void> checkotp() async {
    if (!forgetpasswordformKey.currentState!.validate()) return;

    emit(AuthLoadingState());

    var checkotpResponse = await MyAuthRepo.checkOtp(
      CreateNewPasswordRequest(
        verifycode: otpController.text.trim(),
        email: foregtpasswordemailcontroller.text.trim(),
      ),
    );

    if (checkotpResponse!.statusCode == 200 ||
        checkotpResponse.statusCode == 201) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(checkotpResponse.statusMessage.toString()));
    }
  }

  Future<void> createNew() async {
    if (!forgetpasswordformKey.currentState!.validate()) return;

    emit(AuthLoadingState());

    var createNewResponse = await MyAuthRepo.createNew(
      int.parse(otpController.text.trim()),
      passwordcontroller.text.trim(),
      confirmpasswordcontroller.text.trim(),
    );

    if (createNewResponse!.statusCode == 200 ||
        createNewResponse.statusCode == 201) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(createNewResponse.statusMessage.toString()));
    }
  }
}
