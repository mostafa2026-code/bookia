import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/alif-caesar-rizqi-pratama-loUlSOXL81c-unsplash 1.png",
          ),
          Positioned(
            top: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/logo 2.svg"),
                Text("Order Your Book Now!"),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Log In")),
                ElevatedButton(onPressed: () {}, child: Text("Register")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
