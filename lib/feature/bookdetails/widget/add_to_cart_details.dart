import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';

import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddToCartDetails extends StatelessWidget {
  const AddToCartDetails({super.key, required this.model});

  final Product model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          model.price ?? "\$55",
          style: MytextStyles.main16_400().copyWith(fontSize: 18),
        ),

        Gap(30),
        Expanded(
          child: Mainbottm(onpressed: () {}, title: "Add To Cart"),
        ),
      ],
    );
  }
}
