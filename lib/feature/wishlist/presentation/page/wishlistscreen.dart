import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';

import 'package:bookia/feature/wishlist/presentation/widgets/wish_list_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getWishList(),

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Wishlist", style: MytextStyles.main24_400()),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit cubit = context.read<HomeCubit>();
            if (state is! HomeSuccess) {
              return const Center(child: CircularProgressIndicator());
            }
            if (cubit.books.isEmpty) {
              return Center(child: Text("No Products Found"));
            } else {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WishListListView(books: cubit.books, cubit: cubit),
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
