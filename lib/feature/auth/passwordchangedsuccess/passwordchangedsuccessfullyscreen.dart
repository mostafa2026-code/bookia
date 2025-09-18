import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Passwordchangedsuccessfullyscreen extends StatelessWidget {
  const Passwordchangedsuccessfullyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/icons/Succes.json"),
            Gap(40),
            Text("Password Changed!"),
            Gap(10),
            Text("Your password has been changed\nsuccessfully.", textAlign: TextAlign.center,),
            ElevatedButton(onPressed: (){}, child: Text("Back to Login")),
          ],
        ),
      ),
    );
  }
}