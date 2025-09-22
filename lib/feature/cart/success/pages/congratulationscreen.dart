import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Congratulationscreen extends StatelessWidget {
  const Congratulationscreen({super.key});

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
                "SUCCESS!",
                style: MytextStyles.main20_600().copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(10),
              Text(
                "Your order will be delivered soon.\nThank you for choosing our app!",
                textAlign: TextAlign.center,
                style: MytextStyles.sub16_400(),
              ),
              Gap(40),
              Mainbottm(
                onpressed: () {
                  MyNavigation.go(context,MyRouts.otpverication, null);
                },
                title: "Back to Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
