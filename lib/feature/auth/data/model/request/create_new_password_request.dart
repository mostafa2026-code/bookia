class CreateNewPasswordRequest {
  final String verifycode;
  final String email;


  CreateNewPasswordRequest( {
    required this.verifycode,
    required this.email,
  
  });



  Map<String, dynamic> fromObJectToJson(){
    Map<String, dynamic> requestJson = {
      "verify_code": verifycode,
      "email": email
    };
    return requestJson;
  }
}
