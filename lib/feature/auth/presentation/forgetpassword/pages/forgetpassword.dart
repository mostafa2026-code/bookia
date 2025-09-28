// ignore: file_names
import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowbackAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: Mainbottm(
                    onpressed: () {
                      MyNavigation.push(context, MyRouts.otpverication, null);
                    },
                    title: "Send Code",
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
