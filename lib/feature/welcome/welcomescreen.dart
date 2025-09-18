import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/alif-caesar-rizqi-pratama-loUlSOXL81c-unsplash 1.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(150),
                SvgPicture.asset("assets/images/logo 2.svg"),
                Text("Order Your Book Now!"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Log In")),
                ElevatedButton(onPressed: () {}, child: Text("Register")),
                Gap(150),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
