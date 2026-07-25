import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward.freezed.dart';

@freezed
abstract class Reward with _$Reward {
  const factory Reward({
    required String id,
    required String title,
    @Default('') String subtitle,
    @Default(0) int pointsCost,
  }) = _Reward;
}
