import 'package:teknolup/features/auth/data/models/auth_user.dart';

abstract interface class AuthRepository {
  Future<AuthUser> login(String email, String password);
  Future<AuthUser> register(String email, String password, String fullName);

  /// Restores the session from the persisted auth cookie, if any.
  Future<AuthUser?> getCurrentUser();
  Future<void> logout();
}
