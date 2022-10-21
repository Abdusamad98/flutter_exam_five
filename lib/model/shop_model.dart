import 'package:json_annotation/json_annotation.dart';

part 'shop_model.g.dart';

@JsonSerializable()
class Shop {
  @JsonKey(defaultValue: 0, name: "id")
  int id;
  @JsonKey(defaultValue: "", name: "name")
  String name;
  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;
  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  Shop({required this.id, required this.name, required this.imageUrl, required this.createdAt});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}
