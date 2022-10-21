import 'package:json_annotation/json_annotation.dart';

part 'get_categories_model.g.dart';

@JsonSerializable()
class GetCategoriesModel {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  GetCategoriesModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesModelToJson(this);
}
