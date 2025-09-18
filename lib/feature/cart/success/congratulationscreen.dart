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
              Text("SUCCESS!"),
              Gap(10),
              Text(
                "Your order will be delivered soon.\nThank you for choosing our app!",
                textAlign: TextAlign.center,
              ),
              Gap(40),
              ElevatedButton(onPressed: () {}, child: Text("Back to Home")),
            ],
          ),
        ),
      ),
    );
  }
}
