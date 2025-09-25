import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/bookdetails/model_details.dart';
import 'package:bookia/feature/bookdetails/widget/add_to_cart_details.dart';
import 'package:flutter/material.dart';

class DetialsBody extends StatelessWidget {
  const DetialsBody({
    super.key,
    required this.model,
  });

  final ModelDetails model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(model.image),
          Text(
            model.title,
            style: MytextStyles.main24_400().copyWith(fontSize: 30),
          ),
          Text(
            model.author,
            style: MytextStyles.main16_400().copyWith(fontSize: 18),
          ),
          AddToCartDetails(model: model)
        ],
      ),
    );
  }
}
