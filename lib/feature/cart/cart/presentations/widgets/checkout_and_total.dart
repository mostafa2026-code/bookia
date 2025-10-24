import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';

class CheckoutAndTotal extends StatelessWidget {
  const CheckoutAndTotal({super.key, required this.total});
  final String total;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: MytextStyles.sub14_400().copyWith(fontSize: 20),
              ),
              Text(total),
            ],
          ),
          Mainbottm(
            onpressed: () {
              MyNavigation.push(context, MyRouts.place, total);
            },
            title: "Checkout",
          ),
        ],
      ),
    );
  }
}
