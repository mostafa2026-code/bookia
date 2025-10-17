import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/state/auth_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:gap/gap.dart';

class Createnewpasswordscreen extends StatelessWidget {
  const Createnewpasswordscreen({super.key, required this.otp});
  final String otp;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          const Center(child: CircularProgressIndicator());
        }else if (state is AuthErrorState) {
          MyNavigation.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));

        }
        else if (state is AuthSuccessState) {
          MyNavigation.pop(context);
          MyNavigation.pushReplace(context, MyRouts.passwordChangedSuccessfully, null);
        }
      },
      child: Scaffold(
        appBar: ArrowbackAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create new password"),
                  Text(
                    "Your new password must be unique from those previously used.",
                  ),
                  Gap(32),
                  TextFormField(
                    controller: AuthCubit().passwordcontroller,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  Gap(16),
                  TextFormField(
                    controller: AuthCubit().confirmpasswordcontroller,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  Gap(100),
                  Center(
                    child: Mainbottm(onpressed: () {
                      AuthCubit cubit = context.read<AuthCubit>();
                      cubit.createNew();
                    }, title: "Reset Password"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
