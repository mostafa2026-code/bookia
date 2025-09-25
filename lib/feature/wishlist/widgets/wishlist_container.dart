import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Rectangle 22 (1).png",
            height: 100,
            width: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Name",
                style: MytextStyles.sub16_400().copyWith(fontSize: 18),
              ),
              Text(
                "Book Price",
                style: MytextStyles.main16_400().copyWith(fontSize: 18),
              ),
              Mainbottm(onpressed: () {}, title: "Add To Cart"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset("assets/images/Shape.svg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
