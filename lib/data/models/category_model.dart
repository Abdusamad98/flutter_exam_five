import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(defaultValue: 0, name: "id")
  int categoryId;

  @JsonKey(defaultValue: "", name: "name")
  String categoryName;

  @JsonKey(defaultValue: "", name: "image_url")
  String categoryImageUrl;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.createdAt,
    required this.categoryImageUrl
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
