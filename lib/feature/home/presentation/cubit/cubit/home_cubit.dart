import 'package:bookia/feature/home/data/model/home_response/home_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getBestSeller() async {
    emit(HomeLoading());
    
    HomeResponse? res = await HomeRepo.bestSellerBooks();
    if (res != null) {
      emit(HomeSuccess());
    } else {
      emit(HomeError("error"));
    }
  }
}
