import 'package:bookia/core/services/debouncer/my_debouncer.dart';
import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';
import 'package:bookia/feature/home/presentation/widget/home_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Debouncer _debouncer = Debouncer(milliseconds: 5000);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..allProduct(),

      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit cubit = context.watch<HomeCubit>();
            if (state is HomeLoading) {
              return Center(child: const CircularProgressIndicator.adaptive());
            } else if (state is HomeError) {
              return Center(child: Text(state.error));
            } else if (state is HomeSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          _debouncer.run(() {
                            cubit.search(value);
                          });
                        },
                        validator: (value) {
                          return null;
                        },
                        decoration: InputDecoration(hintText: ""),
                      ),
                      Gap(24),
                      searchController.text.isEmpty
                          ? HomeGridView(
                              cubit: cubit,
                              products: cubit.bestSeller ?? [],
                            )
                          : SearchGridView(
                              products: cubit.searchResult ?? [],
                              cubit: cubit,
                            ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
