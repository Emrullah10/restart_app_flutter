// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyService _$NearbyServiceFromJson(Map<String, dynamic> json) =>
    _NearbyService(
      name: json['name'] as String,
      type: json['type'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      tags: json['tags'] as String? ?? '',
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$NearbyServiceToJson(_NearbyService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'rating': instance.rating,
      'tags': instance.tags,
      'address': instance.address,
    };
