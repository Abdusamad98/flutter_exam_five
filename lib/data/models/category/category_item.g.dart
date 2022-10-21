// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      imgUrl: json['image_url'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imgUrl,
      'created_at': instance.createdAt,
    };
