// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      categoryId: json['category_id'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      productName: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.productName,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'description': instance.description,
    };
