// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingModel _$ListingModelFromJson(Map<String, dynamic> json) =>
    _ListingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String? ?? 'active',
      imageUrl: json['imageUrl'] as String?,
      isSold: json['isSold'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ListingModelToJson(_ListingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'isSold': instance.isSold,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
