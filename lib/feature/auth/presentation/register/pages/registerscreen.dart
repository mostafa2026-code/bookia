import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authcubit = context.read<AuthCubit>();
    return Scaffold(
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
                    Gap(32),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    Gap(16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (authcubit.isvalidEmail(value) == false) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Email"),
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
                        hintText: "Password",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    Gap(16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != authcubit.passwordcontroller.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    Gap(32),
                    Center(
                      child: Mainbottm(
                        onpressed: () async{
                          if (authcubit.formKey.currentState!.validate()) {
                          await authcubit.register();
                            MyNavigation.pushReplace(
                              // ignore: use_build_context_synchronously
                              context,
                              MyRouts.home,
                              null,
                            );
                          }
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
              child: Text(" Login Now", style: MytextStyles.textbottomstyle()),
            ),
          ],
        ),
      ),
    );
  }
}
