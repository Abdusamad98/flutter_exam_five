// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleCat _$SingleCatFromJson(Map<String, dynamic> json) => SingleCat(
      name: json['name'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      categoryId: json['category_id'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$SingleCatToJson(SingleCat instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'category_id': instance.categoryId,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
    };
