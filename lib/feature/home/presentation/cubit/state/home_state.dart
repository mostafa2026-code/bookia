class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

class HomeSuccess extends HomeState {}
