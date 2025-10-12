import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    int number = 1;
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: item.itemProductImage ?? "",
            errorWidget: (context, url, error) =>
                Center(child: Text("Not Found")),
            placeholder: (context, url) => CircularProgressIndicator(),
            width: 100,
            height: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.itemProductName ?? "Book Name",
                style: MytextStyles.sub16_400().copyWith(fontSize: 18),
              ),
              Text(
                item.itemProductPrice ?? "\$55",
                style: MytextStyles.main16_400().copyWith(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.black),
                    color: Color(0xffE0E0E0),
                  ),
                  Text(
                    number.toString(),
                    style: MytextStyles.main16_400().copyWith(fontSize: 18),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.black),
                    color: Color(0xffE0E0E0),
                  ),
                ],
              ),
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
    );
  }
}
