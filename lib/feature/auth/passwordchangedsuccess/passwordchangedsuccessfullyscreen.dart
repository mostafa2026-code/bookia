import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/auth/register/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Passwordchangedsuccessfullyscreen extends StatelessWidget {
  const Passwordchangedsuccessfullyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/icons/Succes.json"),
              Gap(40),
              Text(
                "Password Changed!",
                style: MytextStyles.main20_600().copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(10),
              Text(
                "Your password has been changed successfully.",
                textAlign: TextAlign.center,
                style: MytextStyles.sub14_400(),
              ),
              Gap(40),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Back to Login",
                  style: MytextStyles.elevatedbottomtextstyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
