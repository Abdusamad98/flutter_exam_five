import 'package:json_annotation/json_annotation.dart';

part 'shop_info_model.g.dart';

@JsonSerializable()

class ShopInfo {
  @JsonKey(defaultValue: 0, name: "id")
  int id;
  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;
  @JsonKey(defaultValue: "", name: "name")
  String name;
  @JsonKey(defaultValue: 0, name: "price")
  int price;
  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;
  @JsonKey(defaultValue: "", name: "description")
  String description;

  ShopInfo({required this.id, required this.categoryId, required this.name, required this.price, required this.imageUrl, required this.description});

  factory ShopInfo.fromJson(Map<String, dynamic> json) => _$ShopInfoFromJson(json);
}
