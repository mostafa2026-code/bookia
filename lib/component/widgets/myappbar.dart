import 'package:bookia/core/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowbackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArrowbackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () => MyNavigation.pop(context),
        child: SvgPicture.asset("assets/images/back.svg")),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
