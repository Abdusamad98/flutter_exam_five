// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      name: json['name'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'category_id': instance.categoryId,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
