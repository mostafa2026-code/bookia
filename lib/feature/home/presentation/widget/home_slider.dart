import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/src/cached_image_widget.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<MyHomeSlider>? sliders;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  MyHomeSlider? currentSlider;
  int activeIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            currentSlider = widget.sliders![index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: currentSlider!.image ?? "",
                errorWidget: (context, url, error) => Center(child:Text("Not Found")),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: widget.sliders!.length,
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Gap(20),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.sliders!.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Mycolors.lightPrimary,
            dotColor: Mycolors.lightPrimary,
          ),
        ),
      ],
    );
  }
}
