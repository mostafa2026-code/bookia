import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/wishlist/data/model/response/wish_list_response/datum.dart';

import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_container.dart';
import 'package:flutter/material.dart';

class WishListListView extends StatelessWidget {
  const WishListListView({super.key, required this.books, required this.cubit});

  final List<WishListBook> books;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,

        scrollDirection: Axis.vertical,
        itemCount: books.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          if (books.isEmpty) {
            return Text("No Products in your WishList");
          }
          WishListBook book = books[index];
          return Expanded(
            child: WishListContainer(book: book, cubit: cubit),
          );
        },
      ),
    );
  }
}
