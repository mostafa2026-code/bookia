import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowbackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! Register to get started",
                    style: MytextStyles.main24_400().copyWith(fontSize: 30),
                  ),
                  Gap(32),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  Gap(16),
                  TextFormField(decoration: InputDecoration(hintText: "Email")),
                  Gap(16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
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
                  Gap(32),
                  Center(
                    child: Mainbottm(onpressed: () {}, title: "Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            TextButton(
              onPressed: () {
                MyNavigation.pushReplace(context, MyRouts.login, null);
              },
              style: TextButton.styleFrom(padding: EdgeInsets.all(1)),
              child: Text(" Login Now", style: MytextStyles.textbottomstyle()),
            ),
          ],
        ),
      ),
    );
  }
}
