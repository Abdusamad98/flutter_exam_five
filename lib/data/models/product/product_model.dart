// Product Date example
// {
//   "id":1,
//   "category_id":1,
//   "name":"Macbook",
//   "price":1200,
//   "image_url":"https://e7.pngegg.com/pngimages/765/477/png-clipart-macbook-macbook.png",
//   "description":"Bu description bo'ladi"
// },

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.categoryId,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @JsonKey(defaultValue: -1, name: 'category_id')
  int categoryId;

  @JsonKey(defaultValue: -1, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'price')
  int price;

  @JsonKey(defaultValue: "", name: 'image_url')
  String imageUrl;

  @JsonKey(defaultValue: "", name: 'description')
  String description;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
