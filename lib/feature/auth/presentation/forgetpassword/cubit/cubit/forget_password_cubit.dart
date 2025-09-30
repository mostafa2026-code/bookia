import 'package:bookia/feature/auth/data/model/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/my_auth_repo.dart';
import 'package:bookia/feature/auth/presentation/forgetpassword/cubit/state/forget_password_states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordInitialState> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());
  Future? forgetPassword() async {
    emit(ForgetPasswordLoadingState() as ForgetPasswordInitialState);
    var myres = await MyAuthRepo.forgetPassword(
      AuthParams(email: "emailController.text"),
    );
    if (myres != null) {
      emit(ForgetPasswordSuccessState() as ForgetPasswordInitialState);
    } else {
      emit(ForgetPasswordErrorState() as ForgetPasswordInitialState);
    }
  }
}
