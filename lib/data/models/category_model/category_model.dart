import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

// "id": 2,
// "name": "Accessories",
// "image_url": "https://www.kindpng.com/picc/m/720-7209083_phone-accessories-png-transparent-hd-photo-mobile-phone.png",
// "created_at": "2022-10-18 06:11:45.559309"
@JsonSerializable()
class CategoryModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
