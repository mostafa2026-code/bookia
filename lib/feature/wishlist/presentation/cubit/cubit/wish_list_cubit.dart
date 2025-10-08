import 'package:bookia/feature/wishlist/data/repo/wish_list_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/state/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  void getAllWishList() {
    emit(WishListLoading());
    var response = WishListRepo.getwishList();
    if (response != null) {
      emit(WishListSucces());
    } else {
      emit(WishListError());
    }
  }
}
