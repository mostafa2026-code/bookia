import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartcubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({super.key, required this.item, required this.cubit});
  final CartItem item;
  final Cartcubit cubit;

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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemProductName ?? "Book Name",
                  style: MytextStyles.sub16_400().copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.itemProductPrice ?? "\$55",
                  style: MytextStyles.main16_400().copyWith(fontSize: 18),
                ),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (item.itemQuantity! < item.itemProductStock!) {
                              item.itemQuantity = item.itemQuantity! + 1;
                              cubit.update(
                                item.itemId ?? 0,
                                item.itemQuantity ?? 0,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Out of stock"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ),
                    Text(
                      item.itemQuantity.toString(),
                      style: MytextStyles.main16_400().copyWith(fontSize: 18),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (item.itemQuantity! > 1) {
                              item.itemQuantity = item.itemQuantity! - 1;
                              cubit.update(
                                item.itemId ?? 0,
                                item.itemQuantity ?? 5,
                              );
                            } else {}
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.remove, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  cubit.removeFromCart(item.itemId ?? 0);
                },
                child: SvgPicture.asset(
                  "assets/images/Shape.svg",
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
