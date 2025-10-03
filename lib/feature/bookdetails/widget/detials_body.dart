import 'package:bookia/core/utils/styles/mystyles.dart';

import 'package:bookia/feature/bookdetails/widget/add_to_cart_details.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:flutter/material.dart';

class DetialsBody extends StatelessWidget {
  const DetialsBody({super.key, required this.model});

  final Product model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(model.image ?? "assets/images/Mask group.png", height: 270, width: 180),
          Text(
            model.name??"Book Name",
            style: MytextStyles.main24_400().copyWith(fontSize: 30),
          ),
          Text(
            model.price??"Author Name",
            style: MytextStyles.main16_400().copyWith(fontSize: 18),
          ),
          Spacer(),
          AddToCartDetails(model: model),
        ],
      ),
    );
  }
}
