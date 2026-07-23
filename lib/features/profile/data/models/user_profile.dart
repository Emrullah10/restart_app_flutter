import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String fullName,
    @Default('Member') String role,
    @Default(0) int totalPoints,
    @Default(0) int recycleCount,
    @Default('0.0') String co2Saved,
    @Default(0) int repairedCount,
    @Default(0.0) double preventedWasteKg,
    @Default(0.0) double totalEarnings,
    @Default(1) int level,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
