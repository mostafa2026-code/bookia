import 'package:bookia/feature/cart/cart/pages/cartscreen.dart';
import 'package:bookia/feature/home/presentation/pages/homescreen.dart';
import 'package:bookia/feature/profile/profilemain/pages/profilescreen.dart';
import 'package:bookia/feature/wishlist/presentation/page/wishlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentindex = 0;
  List<Widget> mainscreenBodies = [
    Homescreen(),
    Wishlistscreen(),
    Cartscreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainscreenBodies[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        type: BottomNavigationBarType.fixed,

        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        currentIndex: currentindex,
        elevation: 3,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Bookmark.svg"),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Group.svg"),
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
