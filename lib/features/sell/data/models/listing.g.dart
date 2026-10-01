// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Listing _$ListingFromJson(Map<String, dynamic> json) => _Listing(
  id: json['id'] as String?,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  status: json['status'] as String? ?? 'active',
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$ListingToJson(_Listing instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'price': instance.price,
  'status': instance.status,
  'images': instance.images,
};
