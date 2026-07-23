import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/data/models/auth_user.dart';
import 'package:mobile_flutter/features/auth/data/repositories/auth_repository_impl.dart';

/// Holds the currently authenticated user, or null when signed out.
class AuthViewModel extends AsyncNotifier<AuthUser?> {
  @override
  AuthUser? build() => null;

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

  void logout() {
    state = const AsyncData(null);
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, AuthUser?>(
  AuthViewModel.new,
);
