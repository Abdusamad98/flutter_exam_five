// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      name: json['name'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
    };
