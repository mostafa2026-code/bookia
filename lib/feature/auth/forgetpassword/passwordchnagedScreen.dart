import 'package:bookia/core/utils/styles/mystyles.dart';
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
                Text(
                  "Forgot Password?",
                  style: MytextStyles.main24_400().copyWith(fontSize: 30),
                ),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: MytextStyles.sub16_400(),
                ),
                Gap(32),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter your email"),
                ),
                Gap(32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Send Code",
                      style: MytextStyles.elevatedbottomtextstyle(),
                    ),
                  ),
                ),
                Gap(32),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Remember Password?"),
            TextButton(
              onPressed: () {},
              child: Text("Login", style: MytextStyles.textbottomstyle()),
            ),
          ],
        ),
      ),
    );
  }
}
