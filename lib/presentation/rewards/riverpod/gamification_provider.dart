import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/models/models.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';

class GamificationState {
  final bool isLoading;
  final String? error;
  final List<BadgeModel> badges;
  final Map<String, dynamic>? leaderboard;

  GamificationState({
    this.isLoading = false,
    this.error,
    this.badges = const [],
    this.leaderboard,
  });

  GamificationState copyWith({
    bool? isLoading,
    String? error,
    List<BadgeModel>? badges,
    Map<String, dynamic>? leaderboard,
  }) {
    return GamificationState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      badges: badges ?? this.badges,
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }
}

class GamificationNotifier extends StateNotifier<GamificationState> {
  final IApiService _apiService;
  final String? _userId;

  GamificationNotifier(this._apiService, this._userId)
    : super(GamificationState()) {
    if (_userId != null) {
      loadData();
    }
  }

  Future<void> loadData() async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final badges = await _apiService.getUserBadges(_userId);
      final leaderboard = await _apiService.getLeaderboard(
        userId: _userId,
        limit: 3,
      );

      state = state.copyWith(
        isLoading: false,
        badges: badges,
        leaderboard: leaderboard,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final gamificationProvider =
    StateNotifierProvider.autoDispose<GamificationNotifier, GamificationState>((
      ref,
    ) {
      final apiService = ref.watch(apiServiceProvider);
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id']?.toString();

      return GamificationNotifier(apiService, userId);
    });

final badgesProvider = Provider.autoDispose<GamificationState>((ref) {
  return ref.watch(gamificationProvider);
});

final leaderboardProvider = Provider.autoDispose<GamificationState>((ref) {
  return ref.watch(gamificationProvider);
});
