// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categoryId: json['id'] as int? ?? 0,
      categoryName: json['name'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      categoryImageUrl: json['image_url'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'name': instance.categoryName,
      'image_url': instance.categoryImageUrl,
      'created_at': instance.createdAt,
    };
