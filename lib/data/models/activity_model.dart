import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required String id,
    @JsonKey(name: 'activityType') required String type,
    required String title,
    required String description,
    @Default(0) int pointsEarned,
    @Default(0.0) double amountEarned,
    required DateTime createdAt,
    String? userId,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
