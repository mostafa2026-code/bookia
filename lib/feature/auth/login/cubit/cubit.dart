import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/login/cubit/state.dart';

class SigninCubit extends Cubit<SignINState>{
  SigninCubit():super(SigninInitial());
  
}