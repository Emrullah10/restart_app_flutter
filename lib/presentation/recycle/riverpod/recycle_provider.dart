import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

enum TransportMode { standard, electric }

class RecycleState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final TransportMode selectedMode;
  final double weightKg;
  final String? wasteType;
  final String? selectedCenterId;

  // Puan hesaplama
  final int basePoints;
  final int bonusPoints;
  final int totalPoints;
  final double commissionTl;

  RecycleState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.selectedMode = TransportMode.standard,
    this.weightKg = 1.0, // MVP: Varsayılan 1 kg
    this.wasteType = 'electronic', // MVP: Varsayılan elektronik
    this.selectedCenterId,
    this.basePoints = 10,
    this.bonusPoints = 0,
    this.totalPoints = 10,
    this.commissionTl = 0.5,
  });

  RecycleState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    TransportMode? selectedMode,
    double? weightKg,
    String? wasteType,
    String? selectedCenterId,
    int? basePoints,
    int? bonusPoints,
    int? totalPoints,
    double? commissionTl,
  }) {
    return RecycleState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      selectedMode: selectedMode ?? this.selectedMode,
      weightKg: weightKg ?? this.weightKg,
      wasteType: wasteType ?? this.wasteType,
      selectedCenterId: selectedCenterId ?? this.selectedCenterId,
      basePoints: basePoints ?? this.basePoints,
      bonusPoints: bonusPoints ?? this.bonusPoints,
      totalPoints: totalPoints ?? this.totalPoints,
      commissionTl: commissionTl ?? this.commissionTl,
    );
  }
}

class RecycleNotifier extends StateNotifier<RecycleState> {
  final IApiService _apiService;

  RecycleNotifier(this._apiService) : super(RecycleState()) {
    // Başlangıçta puanları hesapla
    _recalculatePoints();
  }

  void setTransportMode(TransportMode mode) {
    _recalculatePoints(mode: mode);
  }

  void setWeight(double weightKg) {
    state = state.copyWith(weightKg: weightKg);
    _recalculatePoints();
  }

  void setWasteType(String wasteType) {
    state = state.copyWith(wasteType: wasteType);
  }

  void setCenter(String centerId) {
    state = state.copyWith(selectedCenterId: centerId);
  }

  void _recalculatePoints({TransportMode? mode}) {
    final transportMode = mode ?? state.selectedMode;
    final weight = state.weightKg;

    final basePoints = (weight * 10).round();
    final electricMultiplier = transportMode == TransportMode.electric
        ? 1.5
        : 1.0;
    final bonusPoints = transportMode == TransportMode.electric
        ? (basePoints * 0.5).round()
        : 0;
    final totalPoints = (basePoints * electricMultiplier).round();
    final commissionTl = weight * 0.5;

    state = state.copyWith(
      selectedMode: transportMode,
      basePoints: basePoints,
      bonusPoints: bonusPoints,
      totalPoints: totalPoints,
      commissionTl: commissionTl,
    );
  }

  /// Geri dönüşüm kaydını gönder
  Future<bool> submitRecycle(String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = {
        'userId': userId,
        'serviceCenterId': state.selectedCenterId ?? 'mock-center-id',
        'wasteType': state.wasteType ?? 'electronic',
        'weightKg': state.weightKg,
        'isElectricTransport': state.selectedMode == TransportMode.electric,
      };

      await _apiService.logRecycle(data);

      state = state.copyWith(isLoading: false, isSuccess: true);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void reset() {
    state = RecycleState();
  }
}

final recycleProvider = StateNotifierProvider<RecycleNotifier, RecycleState>((
  ref,
) {
  final apiService = ref.watch(apiServiceProvider);
  return RecycleNotifier(apiService);
});
