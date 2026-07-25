import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/data/models/auth_user.dart';
import 'package:mobile_flutter/features/auth/data/repositories/auth_repository_impl.dart';

/// Holds the currently authenticated user, or null when signed out.
/// On first watch, restores the session from the persisted auth cookie
/// (calls the gateway's /me endpoint) so a logged-in user stays logged in
/// across app restarts.
class AuthViewModel extends AsyncNotifier<AuthUser?> {
  @override
  Future<AuthUser?> build() {
    return ref.read(authRepositoryProvider).getCurrentUser();
  }

  Future<bool> login(String email, String password) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).login(email, password),
    );
    state = result;
    return result.hasValue;
  }

  Future<bool> register(String email, String password, String fullName) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).register(email, password, fullName),
    );
    state = result;
    return result.hasValue;
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, AuthUser?>(
  AuthViewModel.new,
);
