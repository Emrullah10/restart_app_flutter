import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

class RewardsState {
  final bool isLoading;
  final String? error;
  final List<dynamic> rewards;

  RewardsState({
    this.isLoading = false,
    this.error,
    this.rewards = const [],
  });

  RewardsState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? rewards,
  }) {
    return RewardsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      rewards: rewards ?? this.rewards,
    );
  }
}

class RewardsNotifier extends StateNotifier<RewardsState> {
  final IApiService _apiService;

  RewardsNotifier(this._apiService) : super(RewardsState()) {
    loadRewards();
  }

  Future<void> loadRewards() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getRewards();
      state = state.copyWith(isLoading: false, rewards: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final rewardsProvider =
    StateNotifierProvider.autoDispose<RewardsNotifier, RewardsState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return RewardsNotifier(apiService);
});
