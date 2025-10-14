import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/cubit/wish_list_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/state/wish_list_state.dart';

import 'package:bookia/feature/wishlist/presentation/widgets/wish_list_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishList(),

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Wishlist", style: MytextStyles.main24_400()),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            WishListCubit wishListCubit = context.read<WishListCubit>();
            if (state is! WishListSucces) {
              return const Center(child: CircularProgressIndicator());
            }
            if (wishListCubit.books.isEmpty) {
              return Center(child: Text("No Products Found"));
            } else {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WishListListView(
                      books: wishListCubit.books,
                      cubit: wishListCubit,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
