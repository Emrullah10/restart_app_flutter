// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBadge _$UserBadgeFromJson(Map<String, dynamic> json) => _UserBadge(
  name: json['name'] as String,
  icon: json['icon'] as String?,
  color: json['color'] as String?,
  isUnlocked: json['isUnlocked'] as bool? ?? false,
);

Map<String, dynamic> _$UserBadgeToJson(_UserBadge instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'isUnlocked': instance.isUnlocked,
    };
