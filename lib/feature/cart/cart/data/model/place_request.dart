class PlaceRequest {
  final int governorate_id;
  final String name;
  final String phone;
  final String address;
  final String email;

  PlaceRequest({
    required this.governorate_id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> tojson() {
    Map<String, dynamic> req = {
      "governorate_id": governorate_id,
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
    };
    return req;
  }
}
