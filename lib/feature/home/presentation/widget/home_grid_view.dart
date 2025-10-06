import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';

import 'package:bookia/core/utils/styles/mystyles.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 280,
            width: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Mycolors.lightBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/Mask group.png",
                      height: 200,
                      width: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(maxLines: 2,"Book Name", style: MytextStyles.main16_400(),textAlign: TextAlign.justify,),
                ),
                Row(
                  children: [
                    Text(
                      "\$55",
                      style: MytextStyles.main16_400().copyWith(
                        color: Mycolors.lightPrimary,
                      ),
                    ),
                    Gap(30),
                    Expanded(
                      child: Mainbottm(onpressed: () {}, title: "Buy"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
