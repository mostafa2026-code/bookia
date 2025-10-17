import 'package:bookia/feature/cart/cart/data/cart_repo.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/feature/home/data/model/home_response/home_response.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:bookia/feature/home/data/model/search_response/search_response/product.dart';
import 'package:bookia/feature/home/data/model/search_response/search_response/search_response.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response/slider.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Product>? bestSeller = [];
  List<MyHomeSlider>? sliders = [];
  List<SearchProduct>? searchResult = [];

  Future<void> getAllHome() async {
    var sliderReq = HomeRepo.getSliderPhotos();
    var bestSellerReq = HomeRepo.bestSellerBooks();
    var homeresult = await Future.wait([sliderReq, bestSellerReq]);

    var sliderRes = homeresult[0] as SliderResponse;
    var bestSellerRes = homeresult[1] as HomeResponse;

    // ignore: unnecessary_null_comparison
    if (sliderRes != null || bestSellerRes != null) {
      sliders = sliderRes.data!.sliders;
      bestSeller = bestSellerRes.data!.products;
      emit(HomeSuccess());
    } else {
      emit(HomeError("Error "));
    }
  }

  Future<void> search(String title) async {
    emit(HomeLoading());

    SearchResponse? res = await HomeRepo.search(title);
    if (res != null) {
      searchResult = res.data!.products;
      emit(HomeSuccess());
    } else {
      emit(HomeError(res!.message ?? ""));
    }
  }

  Future<void> allProduct() async {
    emit(HomeLoading());

    HomeResponse? res = await HomeRepo.bestSellerBooks();
    if (res != null) {
      bestSeller = res.data!.products;
      emit(HomeSuccess());
    } else {
      emit(HomeError(res!.message ?? ""));
    }
  }

  Future<void> addToCart(int id) async {
    emit(HomeLoading());

    CartResponse? res = await CartRepo.addTOCart(id);
    if (res != null) {
      emit(HomeSuccess());
    } else {
      emit(HomeError(res!.message ?? ""));
    }
  }
}
