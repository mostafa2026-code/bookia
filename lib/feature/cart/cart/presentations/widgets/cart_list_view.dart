import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/cart/presentations/widgets/cart_item_container.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, this.cartItems});
  final List<CartItem>? cartItems;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return CartItemContainer(item: cartItems![index],);
      },
    );
  }
}
