import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/alif-caesar-rizqi-pratama-loUlSOXL81c-unsplash 1.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              SvgPicture.asset("assets/images/logo 2.svg"),
              Text("Order Your Book Now!", style: MytextStyles.main20_400()),
              Spacer(flex: 2),
              Mainbottm(onpressed: () {}, title: "Register"),
              Gap(32),
              Mainbottm(
                onpressed: () {},
                title: "Register",
                fillColor: Colors.white,
                textColor: Mycolors.lightPrimary,
              ),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
