import 'package:bookia/core/utils/styles/mystyles.dart';

import 'package:bookia/feature/wishlist/widgets/wish_list_list_view.dart';
import 'package:flutter/material.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Wishlist", style: MytextStyles.main24_400()),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WishListListView(),
          ],
        ),
      ),
    );
  }
}
