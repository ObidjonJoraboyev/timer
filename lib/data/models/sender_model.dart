class SenderModel {
  final String brandImage;
  final String name;
  final String location;

  SenderModel({
    required this.name,
    required this.location,
    required this.brandImage,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
        name: json["name"] as String? ?? "",
        location: json["location"] as String? ?? "",
        brandImage: json["brand_image"] as String? ?? "");
  }
}
