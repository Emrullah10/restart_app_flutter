import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/recycle/data/repositories/recycle_repository_impl.dart';
import 'package:teknolup/features/recycle/presentation/viewmodel/recycle_state.dart';

class RecycleViewModel extends Notifier<RecycleState> {
  @override
  RecycleState build() => const RecycleState();

  double _estimateFor(double weightKg, TransportMode mode) {
    final basePoints = weightKg * 10;
    final multiplier = mode == TransportMode.electric ? 1.5 : 1.0;
    return basePoints * multiplier;
  }

  void setTransportMode(TransportMode mode) {
    state = state.copyWith(
      selectedMode: mode,
      estimatedPoints: _estimateFor(state.weightKg, mode),
    );
  }

  void setWasteType(String wasteType) {
    state = state.copyWith(wasteType: wasteType);
  }

  void setWeight(double weightKg) {
    state = state.copyWith(
      weightKg: weightKg,
      estimatedPoints: _estimateFor(weightKg, state.selectedMode),
    );
  }

  void setCenter(String? centerId, String? centerName) {
    state = state.copyWith(
      selectedCenterId: centerId,
      selectedCenterName: centerName,
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
      final result = await ref.read(recycleRepositoryProvider).logRecycle(
        userId: userId,
        centerId: centerId,
        wasteType: wasteType,
        weightKg: weightKg,
        isElectricTransport: state.selectedMode == TransportMode.electric,
      );
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        resultTotalPoints: (result['totalPoints'] as num?)?.toInt(),
        resultCommissionTl: (result['commissionTl'] as num?)?.toDouble(),
      );
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
