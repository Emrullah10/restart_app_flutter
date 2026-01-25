import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

// Manuel okuma fonksiyonları build_runner'ın tanıması için global olmalı
Object? _readTotalPoints(Map json, String key) =>
    _readStats(json, 'totalPoints');
Object? _readRecycleCount(Map json, String key) =>
    _readStats(json, 'recycleCount');
Object? _readLevel(Map json, String key) => _readStats(json, 'level');
Object? _readTotalEarnings(Map json, String key) =>
    _readStats(json, 'totalEarnings');
Object? _readRepairedCount(Map json, String key) =>
    _readStats(json, 'repairedCount');
Object? _readPreventedWasteKg(Map json, String key) =>
    _readStats(json, 'preventedWasteKg');
Object? _readCo2Saved(Map json, String key) => _readStats(json, 'co2Saved');

Object? _readStats(Map json, String key) {
  final stats = json['stats'] as Map<String, dynamic>?;
  return stats?[key] ?? json[key];
}

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String email,
    required String fullName,
    String? avatarUrl,
    @Default('user') String role,
    @JsonKey(readValue: _readTotalPoints) @Default(0) int totalPoints,
    @JsonKey(readValue: _readRecycleCount) @Default(0) int recycleCount,
    @JsonKey(readValue: _readLevel) @Default(1) int level,
    @JsonKey(readValue: _readTotalEarnings) @Default(0.0) double totalEarnings,
    @JsonKey(readValue: _readRepairedCount) @Default(0) int repairedCount,
    @JsonKey(readValue: _readPreventedWasteKg)
    @Default(0.0)
    double preventedWasteKg,
    @JsonKey(readValue: _readCo2Saved) @Default('0.0') String co2Saved,
    @Default(0) int rank,
    @Default(0.0) double averageRating,
    @Default(0) int reviewCount,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
