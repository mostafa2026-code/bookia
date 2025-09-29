class Authresponse {
  final String? message;
  final Map<String, dynamic>? data;
  final int? status;
  final Exception? error;

  Authresponse({this.message, this.data, this.status, this.error});
// from map to object  
  factory Authresponse.fromJson(Map<String, dynamic> json) {
    return Authresponse(
      message: json["message"],
      data: json["data"],
      status: json["status"],
      error: json["error"],
    );
  }
}
