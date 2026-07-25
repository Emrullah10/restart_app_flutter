import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/auth/data/models/auth_user.dart';
import 'package:mobile_flutter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final IApiService _api;
  AuthRepositoryImpl(this._api);

  AuthUser _mapUser(Map<String, dynamic> json) => AuthUser(
    id: json['id']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    fullName: json['fullName']?.toString(),
    avatarUrl: json['avatarUrl']?.toString(),
  );

  @override
  Future<AuthUser> login(String email, String password) async {
    // Gateway sets the session as an HttpOnly cookie (handled by Dio's
    // CookieManager); the response body only carries {message, user}.
    final response = await _api.login(email, password);
    return _mapUser(response['user'] as Map<String, dynamic>);
  }

  @override
  Future<AuthUser> register(
    String email,
    String password,
    String fullName,
  ) async {
    final response = await _api.register(email, password, fullName);
    return _mapUser(response['user'] as Map<String, dynamic>);
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    final response = await _api.getCurrentUser();
    if (response == null) return null;
    return _mapUser(response);
  }

  @override
  Future<void> logout() => _api.logout();
}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(apiServiceProvider)),
);
