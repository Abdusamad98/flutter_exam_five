import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable()
class CategoryItem {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "image_url")
  String imgUrl;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  CategoryItem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.createdAt,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
