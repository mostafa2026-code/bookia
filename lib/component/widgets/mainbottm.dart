import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';

class Mainbottm extends StatelessWidget {
  final Function() onpressed;
  final String title;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final int? height;
  const Mainbottm({
    super.key,
    required this.onpressed,
    required this.title,
    this.fillColor = Mycolors.lightPrimary,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor,
        side: BorderSide(color: borderColor),
      ),
      child: Text(
        title,
        style: MytextStyles.elevatedbottomtextstyle().copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
