// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      rank: (json['rank'] as num).toInt(),
      fullName: json['fullName'] as String,
      totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'fullName': instance.fullName,
      'totalPoints': instance.totalPoints,
    };

_Leaderboard _$LeaderboardFromJson(Map<String, dynamic> json) => _Leaderboard(
  topUsers:
      (json['topUsers'] as List<dynamic>?)
          ?.map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currentUser: json['currentUser'] == null
      ? null
      : LeaderboardEntry.fromJson(json['currentUser'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LeaderboardToJson(_Leaderboard instance) =>
    <String, dynamic>{
      'topUsers': instance.topUsers,
      'currentUser': instance.currentUser,
    };
