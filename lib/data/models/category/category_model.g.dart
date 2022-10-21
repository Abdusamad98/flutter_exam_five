// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      createdAt: json['created_at'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      imageUrl: json['image_url'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
    };
