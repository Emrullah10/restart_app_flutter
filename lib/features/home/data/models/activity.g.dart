// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Activity _$ActivityFromJson(Map<String, dynamic> json) => _Activity(
  type: json['type'] as String? ?? 'default',
  title: json['title'] as String? ?? '',
  pointsEarned: (json['pointsEarned'] as num?)?.toInt() ?? 0,
  amountEarned: (json['amountEarned'] as num?)?.toDouble() ?? 0.0,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ActivityToJson(_Activity instance) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'pointsEarned': instance.pointsEarned,
  'amountEarned': instance.amountEarned,
  'createdAt': instance.createdAt.toIso8601String(),
};
