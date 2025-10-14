import 'package:bookia/feature/cart/cart/data/cart_repo.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Cartcubit extends Cubit<CartState> {
  Cartcubit() : super(CartInitial());
  List<CartItem>? cartList = [];
  late dynamic total = "0";
  CartResponse? response;

  void getAllCartItems() async {
    emit(CartLoading());
    CartResponse? res = await CartRepo.getAllCartItems();
    if (res == null) {
      emit(CartError(message: res!.error.toString()));
    } else {
      cartList = res.data!.cartItems;
      total = res.data!.total;
      response = res;
      emit(CartSuccess());
    }
  }

 

  void removeFromCart(int cartItemId) async {
    emit(CartLoading());
    CartResponse? res = await CartRepo.removeFromCart(cartItemId);
    if (res == null) {
      emit(CartError(message: res!.error.toString()));
    } else {
      cartList = res.data!.cartItems;
      total = res.data!.total;
      response = res;
      emit(CartSuccess());
    }
  }
  void update(int cartItemId, int quantaity) async {
    emit(CartLoading());
    CartResponse? res = await CartRepo.updateCart(cartItemId, quantaity);
    if (res == null) {
      emit(CartError(message: res!.error.toString()));
    } else {
      cartList = res.data!.cartItems;
      total = res.data!.total;
      response = res;
      emit(CartSuccess());
    }
  }
}
