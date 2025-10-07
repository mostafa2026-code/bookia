import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

@immutable
class Otpvericationscreen extends StatefulWidget {
  const Otpvericationscreen({super.key});

  @override
  State<Otpvericationscreen> createState() => _OtpvericationscreenState();
}

class _OtpvericationscreenState extends State<Otpvericationscreen> {
  // ignore: non_constant_identifier_names
  final TextEditingController otp_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final FocusNode otp_focus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    otp_controller.dispose();
    otp_focus.dispose();
  }

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
                Text(
                  "OTP Verification",
                  style: MytextStyles.main24_400().copyWith(fontSize: 32),
                ),
                const Gap(16),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: MytextStyles.sub16_400(),
                ),
                const Gap(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pinput(
                      controller: otp_controller,
                      focusNode: otp_focus,
                      length: 4,
                      focusedPinTheme: PinTheme(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Mycolors.lightPrimary),
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(32),
                Mainbottm(onpressed: () {}, title: "Verify"),
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
            const Text("Didn’t received code?"),
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
