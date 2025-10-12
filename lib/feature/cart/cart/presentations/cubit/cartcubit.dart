import 'package:bookia/feature/cart/cart/data/cart_repo.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartcubit extends Cubit {
  Cartcubit() : super(CartInitial());
  List<CartItem>? cartList = [];
  late double? total  = 0.0;

  void getAllCartItems() async {
    emit(CartLoading());
    Response? res = await CartRepo.getAllCartItems();
    if (res == null) {
      emit(CartError(message: res!.statusMessage ?? "Something went wrong"));
    } else {
      cartList = res.data!.cartItems;
      for (var e in cartList!) {
        total = e.itemProductPriceAfterDiscount! + total!;
      }
      emit(CartSuccess());
    }
  }

  void addToCart(int id) async {
    emit(CartLoading());
    Response? res = await CartRepo.addTOCart(id);
    if (res == null) {
      emit(CartError(message: res!.statusMessage ?? "Something went wrong"));
    } else {
      cartList = res.data!.cartItems;
      emit(CartSuccess());
    }
  }

  void removeFromCart(int id) async {
    emit(CartLoading());
    Response? res = await CartRepo.removeFromCart(id);
    if (res == null) {
      emit(CartError(message: res!.statusMessage ?? "Something went wrong"));
    } else {
      cartList = res.data!.cartItems;
      emit(CartSuccess());
    }
  }
}
