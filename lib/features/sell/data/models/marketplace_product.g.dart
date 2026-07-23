// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketplaceProduct _$MarketplaceProductFromJson(Map<String, dynamic> json) =>
    _MarketplaceProduct(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$MarketplaceProductToJson(_MarketplaceProduct instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'rating': instance.rating,
      'location': instance.location,
    };
