import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

enum TransportMode { standard, electric }

class RecycleState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final TransportMode selectedMode;
  final double estimatedPoints;

  RecycleState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.selectedMode = TransportMode.standard,
    this.estimatedPoints = 10.0, // Base calculation mock
  });

  RecycleState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    TransportMode? selectedMode,
    double? estimatedPoints,
  }) {
    return RecycleState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      selectedMode: selectedMode ?? this.selectedMode,
      estimatedPoints: estimatedPoints ?? this.estimatedPoints,
    );
  }
}

class RecycleNotifier extends StateNotifier<RecycleState> {
  final IApiService _apiService;

  RecycleNotifier(this._apiService) : super(RecycleState());

  void setTransportMode(TransportMode mode) {
    // 1.5x Multiplier logic for Electric
    double basePoints = 10.0; // Mock base points per package
    double multiplier = mode == TransportMode.electric ? 1.5 : 1.0;

    state = state.copyWith(
      selectedMode: mode,
      estimatedPoints: basePoints * multiplier,
    );
  }

  Future<bool> submitRecycle(
    String userId,
    String centerId,
    String wasteType,
    double amount,
  ) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = {
        'userId': userId,
        'centerId': centerId,
        'wasteType': wasteType,
        'amount': amount,
        'transportMode': state.selectedMode.name,
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
