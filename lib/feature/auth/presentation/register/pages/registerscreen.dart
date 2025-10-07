import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';
import 'package:bookia/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authcubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          const CircularProgressIndicator();
        } else if (state is AuthErrorState) {
          MyNavigation.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
          debugPrint("Failed");
        } else if (state is AuthSuccessState) {
          MyNavigation.pop(context);
          MyNavigation.pushReplace(context, MyRouts.home, null);
          debugPrint("Succes");
        }
      },
      child: Scaffold(
        appBar: ArrowbackAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Form(
                  key: authcubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello! Register to get started",
                        style: MytextStyles.main24_400().copyWith(fontSize: 30),
                      ),
                      const Gap(32),
                      TextFormField(
                        controller: authcubit.namecontroller,
                        decoration: InputDecoration(hintText: "Username"),
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: authcubit.emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (isvalidEmail(value) == false) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: authcubit.passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (isvalidpassword(value) == false) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: authcubit.confirmpasswordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value !=
                              authcubit.passwordcontroller.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      const Gap(32),
                      Center(
                        child: Mainbottm(
                          onpressed: () async {
                            authcubit.register();
                          },
                          title: "Register",
                        ),
                      ),
                    ],
                  ),
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
              Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  MyNavigation.pushReplace(context, MyRouts.login, null);
                },
                style: TextButton.styleFrom(padding: EdgeInsets.all(1)),
                child: Text(
                  " Login Now",
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
