// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    _ActivityModel(
      id: json['id'] as String,
      type: json['activityType'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pointsEarned: (json['pointsEarned'] as num?)?.toInt() ?? 0,
      amountEarned: (json['amountEarned'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$ActivityModelToJson(_ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityType': instance.type,
      'title': instance.title,
      'description': instance.description,
      'pointsEarned': instance.pointsEarned,
      'amountEarned': instance.amountEarned,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
    };
