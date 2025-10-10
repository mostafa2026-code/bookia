import 'package:bookia/feature/wishlist/data/model/response/wish_list_response/datum.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/cubit/wish_list_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_container.dart';
import 'package:flutter/material.dart';

class WishListListView extends StatelessWidget {
  const WishListListView({super.key, required this.books, required this.cubit});

  final List<WishListBook> books;
  final WishListCubit cubit;

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
          WishListBook book = books[index];
          return Expanded(
            child: WishListContainer(book: book, cubit: cubit),
          );
        },
      ),
    );
  }
}
