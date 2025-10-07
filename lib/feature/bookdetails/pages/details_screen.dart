import 'package:bookia/feature/bookdetails/widget/detials_body.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  final Product model;
  const DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset("assets/images/back.svg"),
        actions: [SvgPicture.asset("assets/images/Bookmark.svg")],
      ),
      body: DetialsBody(model: model),
    );
  }
}
