import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/services/shared_prefrences/shared_pref.dart';
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
    Future.delayed(const Duration(seconds: 3), () async {
      final user = SharedPref.getUserData();
      if (user == null || user.name == null || user.name!.isEmpty) {
        // ignore: use_build_context_synchronously
        MyNavigation.pushReplace(context, MyRouts.welcome, null);
      } else {
        // ignore: use_build_context_synchronously
        MyNavigation.pushReplace(context, MyRouts.main, null);
      }
      // ignore: use_build_context_synchronously
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
          const Center(child: Text("Order Your Book Now!")),
        ],
      ),
    );
  }
}
