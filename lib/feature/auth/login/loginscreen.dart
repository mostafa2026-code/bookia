import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text("Welcome back! Glad\nto see you, Again!"),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter your email"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter your password"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Forgot Password?")],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Log In")),
            Row(children: [Divider(), Text("Log In With"), Divider()]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.outlined(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/facebook_ic.svg"),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/Group 123.svg"),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/cib_apple.svg"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Don’t have an account? "),
                  TextButton(onPressed: () {}, child: Text("Register Now")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
