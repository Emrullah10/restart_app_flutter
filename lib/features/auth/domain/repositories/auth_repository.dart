import 'package:mobile_flutter/features/auth/data/models/auth_user.dart';

abstract interface class AuthRepository {
  Future<AuthUser> login(String email, String password);
  Future<AuthUser> register(String email, String password, String fullName);
}
