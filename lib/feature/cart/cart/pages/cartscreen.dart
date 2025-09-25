import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/cart/cart/widgets/cart_list_view.dart';
import 'package:bookia/feature/cart/cart/widgets/checkout_and_total.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: MytextStyles.main24_400()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: CartListView()),
            CheckoutAndTotal(),
          ],
        ),
      ),
    );
  }
}
