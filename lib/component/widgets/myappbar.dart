import 'package:bookia/core/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowbackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArrowbackAppBar({super.key, this.actions});
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: GestureDetector(
        onTap: () => MyNavigation.pop(context),
        child: SvgPicture.asset("assets/images/back.svg"),
      ),
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
