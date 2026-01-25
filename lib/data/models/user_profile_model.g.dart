// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(
  Map<String, dynamic> json,
) => _UserProfileModel(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['fullName'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  role: json['role'] as String? ?? 'user',
  totalPoints: (_readTotalPoints(json, 'totalPoints') as num?)?.toInt() ?? 0,
  recycleCount: (_readRecycleCount(json, 'recycleCount') as num?)?.toInt() ?? 0,
  level: (_readLevel(json, 'level') as num?)?.toInt() ?? 1,
  totalEarnings:
      (_readTotalEarnings(json, 'totalEarnings') as num?)?.toDouble() ?? 0.0,
  repairedCount:
      (_readRepairedCount(json, 'repairedCount') as num?)?.toInt() ?? 0,
  preventedWasteKg:
      (_readPreventedWasteKg(json, 'preventedWasteKg') as num?)?.toDouble() ??
      0.0,
  co2Saved: _readCo2Saved(json, 'co2Saved') as String? ?? '0.0',
  rank: (json['rank'] as num?)?.toInt() ?? 0,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
  reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
      'totalPoints': instance.totalPoints,
      'recycleCount': instance.recycleCount,
      'level': instance.level,
      'totalEarnings': instance.totalEarnings,
      'repairedCount': instance.repairedCount,
      'preventedWasteKg': instance.preventedWasteKg,
      'co2Saved': instance.co2Saved,
      'rank': instance.rank,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
    };
