class WishListState {}

class WishListInitial extends WishListState {}

class WishListError extends WishListState {
  final String message;

  WishListError({required this.message});
}

class WishListLoading extends WishListState {}

class WishListSucces extends WishListState {}
