// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      categoryId: json['category_id'] as int? ?? -1,
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      imageUrl: json['image_url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
