import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/component/widgets/myappbar.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  final Product book;
  const DetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowbackAppBar(
        actions: [SvgPicture.asset("assets/images/Bookmark.svg")],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Hero(
                    tag: book.id ?? "",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: book.image ?? "",
                        height: 270,
                        errorWidget: (context, url, error) {
                          return Text("Not found ");
                        },
                      ),
                    ),
                  ),
                ),
                Text(book.name ?? "", style: MytextStyles.main16_400()),
                const Gap(20),
                Text(book.category ?? ""),
                const Gap(20),
                Text(book.description ?? "", textAlign: TextAlign.justify),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${book.priceAfterDiscount ?? 0.0}"),
            Mainbottm(onpressed: () {}, title: "Add To Cart"),
          ],
        ),
      ),
    );
  }
}
