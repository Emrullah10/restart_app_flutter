import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/storage/token_storage.dart';

import 'fake_http_client_adapter.dart';

void main() {
  late FakeHttpClientAdapter adapter;
  late InMemoryTokenStorage storage;
  late ApiService api;

  setUp(() {
    adapter = FakeHttpClientAdapter();
    storage = InMemoryTokenStorage();
    api = ApiService(tokenStorage: storage);
    api.debugDio.httpClientAdapter = adapter;
  });

  test('restoreSession hydrates the cached token and attaches it as a Bearer header', () async {
    await storage.write('stored-token');
    await api.restoreSession();

    adapter.responseBody = {'id': 'u1'};
    await api.getCurrentUser();

    expect(adapter.lastRequest?.headers['Authorization'], 'Bearer stored-token');
  });

  test('login stores the returned token and attaches it to subsequent requests', () async {
    adapter.responseBody = {
      'message': 'Login successful',
      'user': {'id': 'u1', 'email': 'x@test.com'},
      'token': 'fresh-token',
    };

    final result = await api.login('x@test.com', 'pw');

    expect(result['user'], isNotNull);
    expect(await storage.read(), 'fresh-token');

    adapter.responseBody = {'id': 'u1'};
    await api.getCurrentUser();
    expect(adapter.lastRequest?.headers['Authorization'], 'Bearer fresh-token');
  });

  test('login throws when the gateway response has no token', () async {
    adapter.responseBody = {
      'message': 'Login successful',
      'user': {'id': 'u1'},
    };

    expect(() => api.login('x@test.com', 'pw'), throwsException);
  });

  test('register stores the returned token and attaches it to subsequent requests', () async {
    // Regression test for the bug where a newly registered user was left
    // with no token, got routed to home, and every guarded call 401'd.
    adapter.responseBody = {
      'message': 'User registered successfully',
      'user': {'id': 'u2', 'email': 'new@test.com'},
      'token': 'register-token',
    };

    final result = await api.register('new@test.com', 'pw', 'New User');

    expect(result['user'], isNotNull);
    expect(await storage.read(), 'register-token');

    adapter.responseBody = {'id': 'u2'};
    await api.getCurrentUser();
    expect(adapter.lastRequest?.headers['Authorization'], 'Bearer register-token');
  });

  test('register throws when the gateway response has no token', () async {
    adapter.responseBody = {
      'message': 'User registered successfully',
      'user': {'id': 'u2'},
    };

    expect(() => api.register('new@test.com', 'pw', 'New User'), throwsException);
  });

  test('requests with no stored token omit the Authorization header', () async {
    adapter.responseBody = <dynamic>[];
    await api.getProducts();

    expect(adapter.lastRequest?.headers.containsKey('Authorization'), false);
  });

  test('getCurrentUser returns null without a network call when there is no cached token', () async {
    final result = await api.getCurrentUser();

    expect(result, null);
    expect(adapter.lastRequest, null, reason: 'no request should have been made');
  });

  test('a 401 response clears the cached token and storage', () async {
    await storage.write('stale-token');
    await api.restoreSession();

    adapter.responseStatusCode = 401;
    adapter.responseBody = {'error': 'Invalid or expired session'};

    final result = await api.getCurrentUser();

    expect(result, null);
    expect(await storage.read(), null);
  });

  test('logout clears storage even without a successful network round trip', () async {
    await storage.write('some-token');
    await api.restoreSession();

    adapter.responseStatusCode = 500;
    await api.logout();

    expect(await storage.read(), null);
  });
}
