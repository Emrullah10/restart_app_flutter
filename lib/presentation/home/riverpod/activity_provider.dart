import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';

class ActivityState {
  final bool isLoading;
  final String? error;
  final List<dynamic> activities;

  ActivityState({
    this.isLoading = false,
    this.error,
    this.activities = const [],
  });

  ActivityState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? activities,
  }) {
    return ActivityState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      activities: activities ?? this.activities,
    );
  }
}

class ActivityNotifier extends StateNotifier<ActivityState> {
  final IApiService _apiService;
  final String? _userId;

  ActivityNotifier(this._apiService, this._userId) : super(ActivityState()) {
    if (_userId != null) {
      loadActivities();
    }
  }

  Future<void> loadActivities({int limit = 10}) async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getActivities(_userId, limit: limit);
      state = state.copyWith(isLoading: false, activities: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final activityProvider =
    StateNotifierProvider.autoDispose<ActivityNotifier, ActivityState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id'];

      return ActivityNotifier(apiService, userId?.toString());
    });
