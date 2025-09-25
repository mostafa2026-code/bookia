import 'package:bookia/feature/wishlist/widgets/wishlist_container.dart';
import 'package:flutter/material.dart';

class WishListListView extends StatelessWidget {
  const WishListListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return WishListContainer();
        },
      ),
    );
  }
}
