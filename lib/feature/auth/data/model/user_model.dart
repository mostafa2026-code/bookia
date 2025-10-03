class UserModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? token;
  String? id;
  UserModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.image,
    this.token,
    this.id,
  });

   Map<String, dynamic> toJson(UserModel user) {
    return {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'phone': user.phone,
      'image': user.image,
      'token': user.token,
      'id': user.id,
    };
  }
}
