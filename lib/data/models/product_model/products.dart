import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

// "id": 1,
// "category_id": 1,
// "name": "Macbook",
// "price": 1200,
// "image_url": "https://e7.pngegg.com/pngimages/765/477/png-clipart-macbook-macbook.png",
// "description": "Bu description bo'ladi"
@JsonSerializable()
class ProductModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;
  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;
  @JsonKey(defaultValue: 0, name: "price")
  int price;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.categoryId,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
