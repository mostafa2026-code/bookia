class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpLoadingState extends OtpStates {}

class OtpSuccessState extends OtpStates {}

class OtpErrorState extends OtpStates {
  final String error;
  OtpErrorState({this.error = "An unexpected error occurred"});
}
