import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/recycle/data/repositories/recycle_repository_impl.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_state.dart';

class RecycleViewModel extends Notifier<RecycleState> {
  @override
  RecycleState build() => const RecycleState();

  void setTransportMode(TransportMode mode) {
    const basePoints = 10.0; // Mock base points per package
    final multiplier = mode == TransportMode.electric ? 1.5 : 1.0;

    state = state.copyWith(
      selectedMode: mode,
      estimatedPoints: basePoints * multiplier,
    );
  }

  Future<bool> submitRecycle(
    String userId,
    String? centerId,
    String wasteType,
    double weightKg,
  ) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref.read(recycleRepositoryProvider).logRecycle(
        userId: userId,
        centerId: centerId,
        wasteType: wasteType,
        weightKg: weightKg,
        isElectricTransport: state.selectedMode == TransportMode.electric,
      );
      state = state.copyWith(isLoading: false, isSuccess: true);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void reset() {
    state = const RecycleState();
  }
}

final recycleViewModelProvider = NotifierProvider<RecycleViewModel, RecycleState>(
  RecycleViewModel.new,
);
