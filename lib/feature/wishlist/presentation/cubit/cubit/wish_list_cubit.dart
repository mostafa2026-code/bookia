import 'dart:developer';

import 'package:bookia/feature/wishlist/data/model/response/wish_list_response/datum.dart';
import 'package:bookia/feature/wishlist/data/repo/wish_list_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/state/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  List<WishListBook> books = [];
  void getWishList() async {
    try {
      emit(WishListLoading());
      var res = await WishListRepo.getwishList();
      if (res == null) {
        emit((WishListError()));
      } else {
        books = res.data.data;
        emit(WishListSucces());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void removeFromWishList() async {
    emit(WishListLoading());
    var res = await WishListRepo.removeFromWishlist();
    if (res == null) {
      emit((WishListError()));
    } else {
      books = res.data.data;
      emit(WishListSucces());
    }
  }
}
