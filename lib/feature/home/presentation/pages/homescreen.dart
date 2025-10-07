import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';
import 'package:bookia/feature/home/presentation/widget/home_grid_view.dart';
import 'package:bookia/feature/home/presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBestSeller()
        ..getSlider(),
      child: BlocBuilder(
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          
          if(state is !HomeSuccess){
            Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [HomeSlider(sliders: homeCubit.sliders), 
                    Gap(20), 
                    HomeGridView(products: homeCubit.bestSeller!)],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
