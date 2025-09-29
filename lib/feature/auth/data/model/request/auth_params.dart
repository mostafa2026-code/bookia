class AuthParams {
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;
  //دي بقا الجسون اللي جاية من الريسبونس بتتحول لابجيكت بعد ما الداتا تيجي من ال api
  AuthParams({this.username, this.email, this.password, this.confirmPassword});
  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      username: json["name"],
      email: json["email"],
      password: json["password"],
      confirmPassword: json["password_confirmation"],
    );
  }

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
