import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';

import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        Product book = products[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 280,
            width: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Mycolors.lightBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: book.image ?? "",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    maxLines: 2,
                    book.name ?? "",
                    style: MytextStyles.main16_400(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      " ${book.priceAfterDiscount ?? 0.0}",
                      style: MytextStyles.main16_400().copyWith(
                        color: Mycolors.lightPrimary,
                      ),
                    ),
                    Gap(30),
                    Expanded(
                      child: Mainbottm(onpressed: () {}, title: "Buy"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
