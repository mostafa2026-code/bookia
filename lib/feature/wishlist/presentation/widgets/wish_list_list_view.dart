import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_container.dart';
import 'package:flutter/material.dart';

class WishListListView extends StatelessWidget {
  const WishListListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,

        scrollDirection: Axis.vertical,
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return Expanded(child: WishListContainer());
        },
      ),
    );
  }
}
