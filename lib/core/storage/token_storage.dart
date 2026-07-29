import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persists the Bearer access token. Implementations are injected into
/// [ApiService] so tests can substitute [InMemoryTokenStorage] without
/// touching platform channels.
abstract class ITokenStorage {
  Future<String?> read();
  Future<void> write(String token);
  Future<void> clear();
}

/// Backed by the Android Keystore / iOS Keychain via flutter_secure_storage.
class SecureTokenStorage implements ITokenStorage {
  static const _key = 'restart_access_token';
  final FlutterSecureStorage _storage;

  SecureTokenStorage({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> write(String token) => _storage.write(key: _key, value: token);

  @override
  Future<void> clear() => _storage.delete(key: _key);
}

/// Test double — no platform channel involved.
class InMemoryTokenStorage implements ITokenStorage {
  String? _token;

  @override
  Future<String?> read() async => _token;

  @override
  Future<void> write(String token) async => _token = token;

  @override
  Future<void> clear() async => _token = null;
}
