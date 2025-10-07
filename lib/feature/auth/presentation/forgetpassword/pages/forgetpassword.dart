// ignore: file_names
import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';
import 'package:bookia/feature/auth/presentation/forgetpassword/cubit/cubit/forget_password_cubit.dart';
import 'package:bookia/feature/auth/presentation/forgetpassword/cubit/state/forget_password_states.dart';
import 'package:bookia/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:gap/gap.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit forgetPasswordCubit = context
        .read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {
        if (state is ForgetPasswordErrorState) {
          MyNavigation.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is AuthLoadingState) {
          showloadingDialog(context);
        } else if (state is AuthSuccessState) {
          MyNavigation.pop(context);
          MyNavigation.pushReplace(context, MyRouts.otpverication, null);
        }
      },
      child: Scaffold(
        appBar: ArrowbackAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: SafeArea(
              child: Form(
                key: forgetPasswordCubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: MytextStyles.main24_400().copyWith(fontSize: 30),
                    ),
                    Text(
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                      style: MytextStyles.sub16_400(),
                    ),
                    Gap(32),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (isvalidEmail(value) == false) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      controller: forgetPasswordCubit.emailController,
                      decoration: InputDecoration(hintText: "Enter your email"),
                    ),
                    Gap(32),
                    Center(
                      child: Mainbottm(
                        onpressed: () {
                          if (forgetPasswordCubit.formKey.currentState!
                              .validate()) {
                            forgetPasswordCubit.forgetPassword();
                          }
                        },
                        title: "Send Code",
                      ),
                    ),
                    Gap(32),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Remember Password?"),
              TextButton(
                onPressed: () {
                  MyNavigation.go(context, MyRouts.login, null);
                },
                child: Text("Login", style: MytextStyles.textbottomstyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
