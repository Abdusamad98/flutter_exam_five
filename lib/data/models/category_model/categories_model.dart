import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoriesModel {

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: "", name: 'image_url')
  String imageUrl;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'createdAt')
  String createdAt;

  CategoriesModel({
    required this.name,
    required this.id,
    required this.createdAt,
    required this.imageUrl,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
