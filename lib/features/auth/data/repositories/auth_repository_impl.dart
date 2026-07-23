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
    final response = await _api.login(email, password);
    // Token is in response['token'], usually save to secure storage here.
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
}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(apiServiceProvider)),
);
