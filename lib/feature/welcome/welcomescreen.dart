import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                SvgPicture.asset("assets/images/logo 2.svg"),
                Text("Order Your Book Now!", style: MytextStyles.main20_400()),
                const Spacer(flex: 2),
                Mainbottm(
                  onpressed: () {
                    MyNavigation.push(context, MyRouts.login, null);
                  },
                  title: "Log In",
                ),
                const Gap(32),
                Mainbottm(
                  onpressed: () {
                    MyNavigation.push(context, MyRouts.main, null);
                  },
                  title: "as  a guest",
                ),
                const Gap(32),
                Mainbottm(
                  onpressed: () {
                    MyNavigation.push(context, MyRouts.register, null);
                  },
                  title: "Register",
                  fillColor: Colors.white,
                  textColor: Mycolors.lightPrimary,
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
