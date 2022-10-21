import 'package:json_annotation/json_annotation.dart';

part 'get_category_by_id_model.g.dart';

@JsonSerializable()
class GetCategoryByIdModel {
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

  GetCategoryByIdModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.categoryId,
      required this.description,
      required this.price});

  factory GetCategoryByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryByIdModelToJson(this);
}
