import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
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
<<<<<<< HEAD
    MyNavigation.pushReplace(context, MyRouts.welcome , null );
=======
    await MyNavigation.pushReplace(context, MyRouts.welcome);
>>>>>>> 29f1a12e6da43db7f1200e5f2a56bb57025db2ba
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
