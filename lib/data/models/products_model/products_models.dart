import 'package:json_annotation/json_annotation.dart';

part 'products_models.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel {

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'category_id')
  int categoryId;

  @JsonKey(defaultValue: 0, name: 'price')
  int price;

  @JsonKey(defaultValue: "", name: 'createdAt')
  String createdAt;

  @JsonKey(defaultValue: "", name: 'image_url')
  String imageUrl;

  @JsonKey(defaultValue: "", name: 'description')
  String description;

  ProductsModel({
    required this.name,
    required this.imageUrl,
    required this.createdAt,
    required this.id,
    required this.price,
    required this.description,
    required this.categoryId
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
