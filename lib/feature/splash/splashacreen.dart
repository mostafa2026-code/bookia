import 'package:bookia/core/utils/functions/navigation.dart';
import 'package:bookia/feature/welcome/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SvgPicture.asset("assets/images/logo 2.svg"),
          Text("Order Your Book Now!"),
        ],
      ),
    );
  }
}
