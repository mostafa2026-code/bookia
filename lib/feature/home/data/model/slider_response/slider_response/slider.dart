class MyHomeSlider {
  String? image;

  MyHomeSlider({this.image});

  factory MyHomeSlider.fromJson(Map<String, dynamic> json) =>
      MyHomeSlider(image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'image': image};
}
