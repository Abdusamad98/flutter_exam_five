// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int? ?? 0,
      categoryId: json['category_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      imgUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imgUrl,
      'description': instance.description,
    };
