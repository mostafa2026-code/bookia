import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/wishlist/data/model/response/wish_list_response/datum.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/cubit/wish_list_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key, required this.book, required this.cubit});
  final WishListBook book;
  final WishListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red, child: const Icon(Icons.delete)),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cubit.removeFromWishList();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 0.7),
          color: Mycolors.lightSecondaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "${book.image}",
              errorWidget: (context, url, error) {
                return Text("Not Found ");
              },
              width: 100,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${book.name}",
                    style: MytextStyles.sub16_400().copyWith(fontSize: 18),
                  ),
                  Text(
                    "${book.price}",
                    style: MytextStyles.main16_400().copyWith(fontSize: 18),
                  ),
                  Text(
                    "${book.description}",
                    maxLines: 2,
                    style: MytextStyles.sub14_400(),
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     width: 40,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       border: Border.all(color: Colors.black, width: 0.7),
            //       color: Colors.red,
            //     ),
            //     child: Center(
            //       child: SvgPicture.asset(
            //         "assets/images/Shape.svg",
            //         height: 24,
            //         width: 24,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
