import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';
import 'package:bookia/feature/home/presentation/widget/home_grid_view.dart';
import 'package:bookia/feature/home/presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllHome(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final HomeCubit homeCubit = context.read<HomeCubit>();
          if (state is! HomeSuccess) {
            const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: SvgPicture.asset("assets/images/logo 2.svg"),
              actions: [
                GestureDetector(
                  onTap: () {
                    MyNavigation.push(context, MyRouts.search, null);
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      HomeSlider(sliders: homeCubit.sliders),
                      const Gap(20),
                      HomeGridView(
                        products: homeCubit.bestSeller!,
                        cubit: homeCubit,
                      ),
                    ],
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
