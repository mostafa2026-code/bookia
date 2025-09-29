import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';
import 'package:bookia/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart ';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authcubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthLoadingState) {
          showloadingDialog(context);
        } else if (state is AuthSuccessState) {
          MyNavigation.pushReplace(context, MyRouts.home, null);
        }
      },
      child: Scaffold(
        appBar: ArrowbackAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: authcubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back! Glad to see you, Again!",
                      style: MytextStyles.main24_400().copyWith(fontSize: 30),
                    ),
                    Gap(32),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (authcubit.isvalidEmail(value) == false) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Enter your email"),
                    ),
                    Gap(16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (authcubit.isvalidpassword(value) == false) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: MytextStyles.textbottomstyle(),
                          ),
                          onPressed: () {
                            MyNavigation.push(
                              context,
                              MyRouts.forgetpassword,
                              null,
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(32),
                    Center(
                      child: Mainbottm(
                        onpressed: () {
                          if (authcubit.formKey.currentState!.validate()) {
                            authcubit.login();
                          }
                        },
                        title: "Log In",
                      ),
                    ),
                    Gap(32),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.black)),
                        Gap(2),
                        Text("Log In With"),
                        Gap(2),
                        Expanded(child: Divider(color: Colors.black)),
                      ],
                    ),
                    Gap(32),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.outlined(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/facebook_ic.svg",
                          ),
                        ),

                        IconButton.outlined(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/Group 123.svg"),
                        ),
                        IconButton.outlined(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/cib_apple.svg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an account? "),
              TextButton(
                onPressed: () {
                  MyNavigation.pushReplace(context, MyRouts.register, null);
                },
                style: TextButton.styleFrom(padding: EdgeInsets.all(1)),
                child: Text(
                  "Register Now",
                  style: MytextStyles.textbottomstyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
