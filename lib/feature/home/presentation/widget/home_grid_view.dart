import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/home/data/model/home_response/data.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  List<Product>? products = Data().products;
  HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          Product? productModel = products?[index];
          return GestureDetector(
            onTap: () {
              MyNavigation.push(context, MyRouts.details, productModel);
            },
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      productModel!.image ?? "assets/images/Mask group.png",
                      height: 200,
                      width: 165,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    productModel.name ?? "Book Name",
                    style: MytextStyles.main16_400(),
                  ),
                  Text(
                    productModel.price ?? "\$55",
                    style: MytextStyles.main16_400().copyWith(
                      color: Mycolors.lightPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
