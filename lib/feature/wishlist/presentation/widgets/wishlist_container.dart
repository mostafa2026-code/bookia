import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Expanded(
        child: Card(
          color: Mycolors.lightBackground,
          elevation: 5,
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
              Column(
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
                  Text("DEscription ", style: MytextStyles.sub14_400(),),
                
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/images/Shape.svg"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
