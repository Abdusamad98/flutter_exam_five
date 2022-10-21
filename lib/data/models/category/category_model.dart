// Category Data example
// {
//   "id":1,
//   "name":"Computers",
//   "image_url":"https://www.microsoft.com/en-us/microsoft-365/blog/wp-content/uploads/sites/2/2020/05/Dell-1.png",
//   "created_at":"2022-10-21 06:11:45.559309"
// },

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: false)
class CategoryModel {
  CategoryModel({
    required this.createdAt,
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  @JsonKey(defaultValue: -1, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "created_at")
  String createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
