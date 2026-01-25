// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      latitude: _toDouble(json['latitude']),
      longitude: _toDouble(json['longitude']),
      rating: _toDouble(json['rating']),
      tags: json['tags'] == null ? const [] : _tagsFromJson(json['tags']),
      address: json['address'] as String,
      isActive: json['isActive'] as bool? ?? true,
      distanceMeters: json['distanceMeters'] == null
          ? 0
          : _toDouble(json['distanceMeters']),
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'tags': instance.tags,
      'address': instance.address,
      'isActive': instance.isActive,
      'distanceMeters': instance.distanceMeters,
    };
