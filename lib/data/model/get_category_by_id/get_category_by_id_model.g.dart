// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryByIdModel _$GetCategoryByIdModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoryByIdModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$GetCategoryByIdModelToJson(
        GetCategoryByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
