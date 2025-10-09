import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red, child: const Icon(Icons.delete)),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
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
              imageUrl: "",
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
                    "Book Name",
                    style: MytextStyles.sub16_400().copyWith(fontSize: 18),
                  ),
                  Text(
                    "Book Price",
                    style: MytextStyles.main16_400().copyWith(fontSize: 18),
                  ),
                  Text("DEscription ", style: MytextStyles.sub14_400()),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 0.7),
                  color: Colors.red,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/Shape.svg",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
