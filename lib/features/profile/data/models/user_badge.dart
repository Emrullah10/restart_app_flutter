import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_badge.freezed.dart';
part 'user_badge.g.dart';

@freezed
abstract class UserBadge with _$UserBadge {
  const factory UserBadge({
    required String name,
    String? icon,
    String? color,
    @Default(false) bool isUnlocked,
  }) = _UserBadge;

  factory UserBadge.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeFromJson(json);
}
