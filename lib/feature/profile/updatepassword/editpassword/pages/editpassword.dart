import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Editpassword extends StatelessWidget {
  const Editpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowbackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "New Password",
                    style: MytextStyles.main24_400().copyWith(fontSize: 30),
                  ),
                ),
                Gap(32),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Current Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "New Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Mainbottm(
          onpressed: () {
            MyNavigation.pushReplace(context, MyRouts.otpverication, null);
          },
          title: "Update Password",
        ),
      ),
    );
  }
}
