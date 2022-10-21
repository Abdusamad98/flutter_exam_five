import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: 0, name: "price")
  int price;

  @JsonKey(defaultValue: "", name: "image_url")
  String imgUrl;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  ProductItem({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.description,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}