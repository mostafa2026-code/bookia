import 'package:bookia/feature/home/presentation/widget/home_grid_view.dart';
import 'package:bookia/feature/home/presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
            
              children: [HomeSlider(), Gap(20), HomeGridView()],
            ),
          ),
        ),
      ),
    );
  }
}
