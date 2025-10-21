import 'package:bookia/core/services/shared_prefrences/shared_pref.dart';
import 'package:bookia/feature/cart/cart/data/cart_repo.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/cart/data/model/place_order_request.dart';

import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Cartcubit extends Cubit<CartState> {
  Cartcubit() : super(CartInitial());
  List<CartItem>? cartList = [];
  late dynamic total = "0";
  CartResponse? response;
  TextEditingController nameController = TextEditingController(
    text: SharedPref.getUserData().name,
  );
  TextEditingController emailController = TextEditingController(
    text: SharedPref.getUserData().email,
  );
  TextEditingController addressController = TextEditingController(
    text: SharedPref.getUserData().address,
  );
  TextEditingController phoneController = TextEditingController(
    text: SharedPref.getUserData().phone,
  );
  TextEditingController governorateController = TextEditingController();
  int governorateId = -22;

  void getAllCartItems() async {
    emit(CartLoading());
    CartResponse? res = await CartRepo.getAllCartItems();
    if (res!.data == null) {
      emit(CartError(message: res.error.toString()));
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

    if (res!.data == null) {
      emit(CartError(message: res.error.toString()));
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
    if (res!.data == null) {
      emit(CartError(message: res.error.toString()));
    } else {
      cartList = res.data!.cartItems;
      total = res.data!.total;
      response = res;
      emit(CartSuccess());
    }
  }

  void placeMyOredr() async {
    emit(CartLoading());
    CartResponse? res = await CartRepo.placeOrder(
      PlaceOrderRequest(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
        email: emailController.text.trim(),
        governorateId: governorateId,
      ),
    );
    if (res!.data == null) {
      emit(CartError(message: res.error.toString()));
    } else {
      cartList = res.data!.cartItems;
      total = res.data!.total;
      response = res;
      emit(CartSuccess());
    }
  }
}
