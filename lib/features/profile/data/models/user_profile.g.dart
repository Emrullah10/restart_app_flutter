// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  fullName: json['fullName'] as String,
  role: json['role'] as String? ?? 'Member',
  totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
  recycleCount: (json['recycleCount'] as num?)?.toInt() ?? 0,
  co2Saved: json['co2Saved'] as String? ?? '0.0',
  repairedCount: (json['repairedCount'] as num?)?.toInt() ?? 0,
  preventedWasteKg: (json['preventedWasteKg'] as num?)?.toDouble() ?? 0.0,
  totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0.0,
  level: (json['level'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'role': instance.role,
      'totalPoints': instance.totalPoints,
      'recycleCount': instance.recycleCount,
      'co2Saved': instance.co2Saved,
      'repairedCount': instance.repairedCount,
      'preventedWasteKg': instance.preventedWasteKg,
      'totalEarnings': instance.totalEarnings,
      'level': instance.level,
    };
