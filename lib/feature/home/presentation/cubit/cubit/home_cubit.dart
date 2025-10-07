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
  List<MyHomeSlider>? sliders = [];

  Future<void> getAllHome() async {
    var sliderReq = HomeRepo.getSliderPhotos();
    var bestSellerReq = HomeRepo.bestSellerBooks();
    var homeresult = await Future.wait([sliderReq, bestSellerReq]);

    var sliderRes = homeresult[0] as SliderResponse;
    var bestSellerRes = homeresult[1] as HomeResponse;

    if (sliderRes != null || bestSellerRes != null) {
      sliders = sliderRes.data!.sliders;
      bestSeller = bestSellerRes.data!.products;
      emit(HomeSuccess());
    } else {
      emit(HomeError("Error "));
    }
  }
}
