import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';

class ProfileState {
  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? profile;

  ProfileState({this.isLoading = false, this.error, this.profile});

  ProfileState copyWith({
    bool? isLoading,
    String? error,
    Map<String, dynamic>? profile,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      profile: profile ?? this.profile,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final IApiService _apiService;
  final String? _userId;

  ProfileNotifier(this._apiService, this._userId) : super(ProfileState()) {
    if (_userId != null) {
      loadProfile();
    }
  }

  Future<void> loadProfile() async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      print('DEBUG: Loading Profile for userId: $_userId'); // Debug Log
      final data = await _apiService.getUserProfile(_userId);
      print('DEBUG: Profile Data: $data'); // Debug Log
      state = state.copyWith(isLoading: false, profile: data);
    } catch (e) {
      print('DEBUG: Profile Error: $e'); // Debug Log
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileNotifier, ProfileState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      // Get userId from AuthProvider
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id'];

      return ProfileNotifier(apiService, userId?.toString());
    });
