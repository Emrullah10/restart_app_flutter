// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyService _$NearbyServiceFromJson(Map<String, dynamic> json) =>
    _NearbyService(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: json['type'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      tags: json['tags'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NearbyServiceToJson(_NearbyService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'rating': instance.rating,
      'tags': instance.tags,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
