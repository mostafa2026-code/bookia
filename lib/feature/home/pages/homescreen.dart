import 'package:bookia/feature/cart/cart/cartscreen.dart';

import 'package:bookia/feature/home/widget/home_body.dart';
import 'package:bookia/feature/wishlist/pages/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../profile/profilemain/pages/profilescreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> screens = [
    HomeBody(),
    Wishlist(),
    Cartscreen(),
    Profilescreen(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Home.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Bookmark.svg"),
            label: "Wish List",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Category.svg"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Profile.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
