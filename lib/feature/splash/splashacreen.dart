import 'package:bookia/core/utils/functions/navigation.dart';
import 'package:bookia/feature/welcome/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashacreen extends StatefulWidget {
  const Splashacreen({super.key});

  @override
  State<Splashacreen> createState() => _SplashacreenState();
}

class _SplashacreenState extends State<Splashacreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async{
     // ignore: use_build_context_synchronously
    await Mynavigation.pushreplace(context, Welcomescreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/icons/Books.json")),
          Center(child: Text("Order Your Book Now!")),
        ],
      ),
    );
  }
}
