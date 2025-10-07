import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';

class Mainbottm extends StatelessWidget {
  final Function() onpressed;
  final String title;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double weidth;
  const Mainbottm({
    super.key,
    required this.onpressed,
    required this.title,
    this.fillColor = Mycolors.lightPrimary,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
    this.height = 45,
    this.weidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor,
        side: BorderSide(color: borderColor),
        minimumSize: Size(weidth, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
