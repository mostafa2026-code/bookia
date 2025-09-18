import 'package:bookia/core/utils/widgets/arrowbackcontainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Passwordchnagedscreen extends StatelessWidget {
  const Passwordchnagedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Arrowbackcontainer(),
                Gap(32),
                Text("Forgot Password?"),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                ),
                Gap(32),
                TextFormField(decoration: InputDecoration(hintText: "Enter your email")),
                Gap(32),
                Center(child: ElevatedButton(onPressed: () {}, child: Text("Send Code"))),
                Gap(32),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Remember Password?"),
                      TextButton(onPressed: () {}, child: Text("Login")),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
