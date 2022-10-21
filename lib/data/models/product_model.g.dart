// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      categoryId: json['category_id'] as int? ?? 0,
      productId: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      productImageUrl: json['image_url'] as String? ?? '',
      productName: json['name'] as String? ?? '',
      productPrice: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.productId,
      'category_id': instance.categoryId,
      'name': instance.productName,
      'image_url': instance.productImageUrl,
      'price': instance.productPrice,
      'description': instance.description,
    };
