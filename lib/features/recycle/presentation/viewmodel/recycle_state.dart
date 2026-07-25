import 'package:freezed_annotation/freezed_annotation.dart';

part 'recycle_state.freezed.dart';

enum TransportMode { standard, electric }

@freezed
abstract class RecycleState with _$RecycleState {
  const factory RecycleState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSuccess,
    @Default(TransportMode.standard) TransportMode selectedMode,
    @Default(10.0) double estimatedPoints,
    String? selectedCenterId,
    String? selectedCenterName,
    @Default('electronic') String wasteType,
    @Default(1.0) double weightKg,
    int? resultTotalPoints,
    double? resultCommissionTl,
  }) = _RecycleState;
}
