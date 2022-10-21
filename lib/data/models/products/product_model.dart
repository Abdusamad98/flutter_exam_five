import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';


@JsonSerializable()
class ProductModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: 0, name: "price")
  int price;

  @JsonKey(defaultValue: '', name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: '', name: "description")
  String description;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.price,
    required this.categoryId,
    required this.description
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}