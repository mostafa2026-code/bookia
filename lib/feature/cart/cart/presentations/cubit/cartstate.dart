class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {}

class CartError extends CartState {
  String message;
  CartError({required this.message});
}

class CartEmpty extends CartState {}
