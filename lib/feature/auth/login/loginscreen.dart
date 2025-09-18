import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  height: 41,
                  width: 41,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 0.7),
                  ),
                  child: Center(child: Icon(Icons.arrow_back_ios)),
                ),
              ),
              Gap(32),
              Text("Welcome back! Glad\nto see you, Again!"),
              Gap(32),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              Gap(16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("Forgot Password?")],
              ),
              Gap(32),
              Center(
                child: ElevatedButton(onPressed: () {}, child: Text("Log In")),
              ),
              Gap(32),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black)),
                  Gap(2),
                  Text("Log In With"),
                  Gap(2),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              Gap(32),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account? "),
                      TextButton(onPressed: () {}, child: Text("Register Now")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
