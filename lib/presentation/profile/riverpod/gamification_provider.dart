import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';

// ==================== LEADERBOARD ====================
class LeaderboardState {
  final bool isLoading;
  final String? error;
  final List<dynamic> topUsers;
  final Map<String, dynamic>? currentUser;

  LeaderboardState({
    this.isLoading = false,
    this.error,
    this.topUsers = const [],
    this.currentUser,
  });

  LeaderboardState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? topUsers,
    Map<String, dynamic>? currentUser,
  }) {
    return LeaderboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      topUsers: topUsers ?? this.topUsers,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}

class LeaderboardNotifier extends StateNotifier<LeaderboardState> {
  final IApiService _apiService;
  final String? _userId;

  LeaderboardNotifier(this._apiService, this._userId)
    : super(LeaderboardState()) {
    loadLeaderboard();
  }

  Future<void> loadLeaderboard({int limit = 3}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getLeaderboard(
        userId: _userId,
        limit: limit,
      );
      state = state.copyWith(
        isLoading: false,
        topUsers: data['topUsers'] ?? [],
        currentUser: data['currentUser'],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final leaderboardProvider =
    StateNotifierProvider.autoDispose<LeaderboardNotifier, LeaderboardState>((
      ref,
    ) {
      final apiService = ref.watch(apiServiceProvider);
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id'];

      return LeaderboardNotifier(apiService, userId?.toString());
    });

// ==================== BADGES ====================
class BadgesState {
  final bool isLoading;
  final String? error;
  final List<dynamic> badges;

  BadgesState({this.isLoading = false, this.error, this.badges = const []});

  BadgesState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? badges,
  }) {
    return BadgesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      badges: badges ?? this.badges,
    );
  }
}

class BadgesNotifier extends StateNotifier<BadgesState> {
  final IApiService _apiService;
  final String? _userId;

  BadgesNotifier(this._apiService, this._userId) : super(BadgesState()) {
    if (_userId != null) {
      loadBadges();
    }
  }

  Future<void> loadBadges() async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getUserBadges(_userId);
      state = state.copyWith(isLoading: false, badges: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final badgesProvider =
    StateNotifierProvider.autoDispose<BadgesNotifier, BadgesState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id'];

      return BadgesNotifier(apiService, userId?.toString());
    });
