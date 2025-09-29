class AuthParams {
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;

  AuthParams({this.username, this.email, this.password, this.confirmPassword});

  // عاوزين الابوجيكت دا يتحول ل ماب علشان البودي يقبله لاني ال لودي مكتوب فيه ماب

  Map<String, dynamic> fromObjectToJson() {
    Map<String, dynamic> requestJson = {
      "name": username,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
    };
    return requestJson;
  }
}
