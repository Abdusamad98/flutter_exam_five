// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) => ShopInfo(
      id: json['id'] as int? ?? 0,
      categoryId: json['category_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
