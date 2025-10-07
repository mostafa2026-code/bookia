import 'package:bookia/feature/auth/presentation/otpverication/cubit/otp_state/otp_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());
  void otpverfication() async {
    emit(OtpLoadingState());

    // MyAuthRepo.forgetPassword();
    // For demonstration, we'll assume the OTP verification is always successful
    emit(OtpSuccessState());
    // In a real scenario, you would handle success and error cases based on the verification result
  }
}
