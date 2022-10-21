import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(defaultValue: 0, name: "id")
  int productId;

  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;

  @JsonKey(defaultValue: "", name: "name")
  String productName;

  @JsonKey(defaultValue: "", name: "image_url")
  String productImageUrl;

  @JsonKey(defaultValue: 0, name: "price")
  int productPrice ;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  ProductModel({
    required this.categoryId,
    required this.productId,
    required this.description,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
