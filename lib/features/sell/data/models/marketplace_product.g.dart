// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketplaceProduct _$MarketplaceProductFromJson(Map<String, dynamic> json) =>
    _MarketplaceProduct(
      id: json['id'] as String?,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      location: json['location'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$MarketplaceProductToJson(_MarketplaceProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'rating': instance.rating,
      'location': instance.location,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
