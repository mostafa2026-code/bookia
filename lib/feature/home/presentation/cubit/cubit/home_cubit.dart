import 'package:bookia/feature/home/data/model/home_response/home_response.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response/slider.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Product>? bestSeller = [];
  List<MyHomeSlider>? sliders= [];

  Future<void> getBestSeller() async {
    emit(HomeLoading());

    HomeResponse? res = await HomeRepo.bestSellerBooks();
    if (res != null) {
      emit(HomeSuccess());
      bestSeller = res.data?.products;
    } else {
      emit(HomeError("error"));
    }
  }

  Future<void> getSlider() async {
    emit(HomeLoading());

    SliderResponse? res = await HomeRepo.getSliderPhotos();
    if (res != null) {
      emit(HomeSuccess());
      sliders = res.data?.sliders;
    } else {
      emit(HomeError("error"));
    }
  }
}
