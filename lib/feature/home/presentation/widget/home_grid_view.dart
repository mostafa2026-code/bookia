import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';

import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:bookia/feature/home/data/model/search_response/search_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  const HomeGridView({
    super.key,
    required this.products,
    required HomeCubit cubit,
  });
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(child: Text("No Products Found"));
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 280,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product book = products[index];
          return GestureDetector(
            onTap: () {
              MyNavigation.push(context, MyRouts.details, book);
            },
            child: GridViewContainer(book: book),
          );
        },
      );
    }
  }
}

class GridViewContainer extends StatelessWidget {
  const GridViewContainer({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolors.lightBackground,
        border: BoxBorder.all(color: Mycolors.darkBackground, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: book.id ?? UniqueKey().toString,

              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Center(child: Text("Not Found")),
                    placeholder: (context, url) {
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
          ),
          Gap(10),
          SizedBox(
            height: 40,
            child: Text(
              maxLines: 2,
              book.name ?? "",
              overflow: TextOverflow.ellipsis,
              style: MytextStyles.main16_400(),
            ),
          ),
          Gap(10),
          Row(
            children: [
              Text(
                " ${book.priceAfterDiscount ?? 0.0}",
                style: MytextStyles.main16_400().copyWith(
                  color: Mycolors.lightPrimary,
                ),
              ),
              Gap(10),
              Expanded(
                child: Mainbottm(
                  onpressed: () {},
                  title: "Buy",
                  height: 30,
                  weidth: 70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.products,
    required HomeCubit cubit,
  });
  final List<SearchProduct> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(child: const CircularProgressIndicator());
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 280,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          SearchProduct book = products[index];
          return GestureDetector(
            onTap: () {
              MyNavigation.push(context, MyRouts.details, book);
            },
            child: SearchGridViewContainer(book: book),
          );
        },
      );
    }
  }
}

class SearchGridViewContainer extends StatelessWidget {
  const SearchGridViewContainer({super.key, required this.book});

  final SearchProduct book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolors.lightBackground,
        border: BoxBorder.all(color: Mycolors.darkBackground, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: book.id ?? UniqueKey().toString,

              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Center(child: Text("Not Found")),
                    placeholder: (context, url) {
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
          ),
          Gap(10),
          SizedBox(
            height: 40,
            child: Text(
              maxLines: 2,
              book.name ?? "",
              overflow: TextOverflow.ellipsis,
              style: MytextStyles.main16_400(),
            ),
          ),
          Gap(10),
          Row(
            children: [
              Text(
                " ${book.priceAfterDiscount ?? 0.0}",
                style: MytextStyles.main16_400().copyWith(
                  color: Mycolors.lightPrimary,
                ),
              ),
              Gap(10),
              Expanded(
                child: Mainbottm(
                  onpressed: () {},
                  title: "Buy",
                  height: 30,
                  weidth: 70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
