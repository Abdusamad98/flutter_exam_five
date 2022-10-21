// {
// "id":7,
// "category_id":2,
// "name":"Ear Phone",
// "price":120,
// "image_url":"https://freepikpsd.com/file/2020/12/earphone-png-3.png",
// "description":"Bu description bo'ladi"
// },
// {

import 'package:json_annotation/json_annotation.dart';

part 'single.g.dart';

@JsonSerializable()
class SingleCat {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: 0, name: "price")
  int price;

  @JsonKey(defaultValue: 0, name: "category_id")
  int categoryId;

  @JsonKey(defaultValue: "", name: "image_url")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  SingleCat(
      {required this.name,
      required this.imageUrl,
      required this.id,
      required this.categoryId,
      required this.price,
      required this.description});

  factory SingleCat.fromJson(Map<String, dynamic> json) =>
      _$SingleCatFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCatToJson(this);
}
