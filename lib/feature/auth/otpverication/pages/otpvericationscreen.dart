import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@immutable
// ignore: must_be_immutable
class Otpvericationscreen extends StatelessWidget {
  Otpvericationscreen({super.key});

  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  late final List<TextEditingController> controllors = [one, two, three, four];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                Gap(32),
                Text(
                  "OTP Verification",
                  style: MytextStyles.main24_400().copyWith(fontSize: 32),
                ),
                Gap(16),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: MytextStyles.sub16_400(),
                ),
                Gap(32),
                Row(
                  spacing: 20,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: TextFormField(
                        controller: controllors[index],
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                ),
                Gap(32),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Verify",
                    style: MytextStyles.elevatedbottomtextstyle(),
                  ),
                ),
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
            Text("Didn’t received code?"),
            TextButton(
              onPressed: () {},
              child: Text("Resend", style: MytextStyles.textbottomstyle()),
            ),
          ],
        ),
      ),
    );
  }
}
