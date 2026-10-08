import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/i_api_service.dart';
import 'package:teknolup/core/storage/token_storage.dart';

final apiServiceProvider = Provider<IApiService>((ref) {
  throw UnimplementedError(
    'apiServiceProvider must be overridden in main() with an ApiService whose '
    'restoreSession() has already been awaited.',
  );
});

class ApiService implements IApiService {
  // Mobile API Gateway is the single entry point (port 3004). The host
  // address depends on where the app runs, so it's chosen automatically:
  //   - Android emulator          -> 10.0.2.2 (its alias for the host machine)
  //   - iOS Simulator / macOS     -> localhost (they share the host network)
  // A physical device can't reach either, so pass your machine's LAN IP via
  //   --dart-define=API_BASE_URL=http://192.168.x.x:3004/api
  // When that define is set it always wins, overriding the auto-detection.
  static const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');

  static String get baseUrl {
    if (_envBaseUrl.isNotEmpty) return _envBaseUrl;
    final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    return 'http://$host:3004/api';
  }

  final Dio _dio;
  final ITokenStorage _tokenStorage;

  @visibleForTesting
  Dio get debugDio => _dio;

  // Cached in memory so every request doesn't pay for a secure-storage
  // platform-channel round trip. Hydrated once via [restoreSession] and kept
  // in sync on login/logout/401.
  String? _cachedToken;

  ApiService({required ITokenStorage tokenStorage})
    : _tokenStorage = tokenStorage,
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _cachedToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            _cachedToken = null;
            await _tokenStorage.clear();
          }
          handler.next(error);
        },
      ),
    );
  }

  /// Hydrates the in-memory token from secure storage. Must be awaited once
  /// in main() before runApp, then this ApiService supplied to
  /// [apiServiceProvider] via ProviderScope overrides — this keeps the
  /// provider itself synchronous so every repository/viewmodel that depends
  /// on it does not need to become async.
  Future<void> restoreSession() async {
    _cachedToken = await _tokenStorage.read();
  }

  // Shared by login and register: both endpoints return a fresh
  // {message, user, token}; the token must be cached and persisted the same
  // way regardless of which flow produced it.
  Future<Map<String, dynamic>> _persistTokenFrom(Response response) async {
    final data = response.data as Map<String, dynamic>;
    final token = data['token'] as String?;
    if (token == null) {
      throw Exception('Sunucudan oturum anahtarı alınamadı.');
    }
    _cachedToken = token;
    await _tokenStorage.write(token);
    return data;
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/gateway/login',
        data: {'email': email, 'password': password},
      );
      return await _persistTokenFrom(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final response = await _dio.post(
        '/gateway/register',
        data: {'email': email, 'password': password, 'fullName': fullName},
      );
      return await _persistTokenFrom(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUser() async {
    if (_cachedToken == null) return null;
    try {
      final response = await _dio.get('/gateway/me');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) return null;
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout() async {
    // Clear local state first so logout always "succeeds" from the app's
    // perspective even if the network call below fails (e.g. offline).
    _cachedToken = null;
    await _tokenStorage.clear();
    try {
      await _dio.post('/gateway/logout');
    } on DioException {
      // Stateless on the server side — nothing to roll back locally.
    }
  }

  @override
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/operation/recycle/log', data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getRecycleHistory(String userId) async {
    try {
      final response = await _dio.get('/operation/recycle/history/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    try {
      final response = await _dio.get('/user/profile/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getActivities(String userId, {int limit = 10}) async {
    try {
      final response = await _dio.get(
        '/operation/activities/$userId',
        queryParameters: {'limit': limit},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getLeaderboard({
    String? userId,
    int limit = 3,
  }) async {
    try {
      final response = await _dio.get(
        '/gamification/leaderboard',
        queryParameters: {if (userId != null) 'userId': userId, 'limit': limit},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getUserBadges(String userId) async {
    try {
      final response = await _dio.get('/gamification/badges/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getUserListings(String userId) async {
    try {
      final response = await _dio.get('/marketplace/listings/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getProducts({String? category, int? limit}) async {
    try {
      final response = await _dio.get(
        '/marketplace/products',
        queryParameters: {
          if (category != null) 'category': category,
          if (limit != null) 'limit': limit,
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<String>> uploadListingImages(List<String> filePaths) async {
    try {
      final formData = FormData.fromMap({
        'images': [
          for (final path in filePaths) await MultipartFile.fromFile(path),
        ],
      });
      final response = await _dio.post(
        '/marketplace/upload',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return List<String>.from(response.data['imageUrls'] as List);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> createListing(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/marketplace/listings', data: data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getRewards() async {
    try {
      final response = await _dio.get('/rewards');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> redeemReward(
    String userId,
    String rewardId,
  ) async {
    try {
      final response = await _dio.post(
        '/rewards/redeem',
        data: {'userId': userId, 'rewardId': rewardId},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getServices({String? type}) async {
    try {
      final response = await _dio.get(
        '/operation/services',
        queryParameters: {if (type != null) 'type': type},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getMotivationMessage(
    String productModel,
    String condition,
  ) async {
    try {
      final response = await _dio.post(
        '/operation/ai/generate-motivation',
        data: {'productModel': productModel, 'condition': condition},
      );
      return response.data;
    } catch (_) {
      return {'message': 'Hata oluştu, tekrar deneyin.', 'savings': 0};
    }
  }

  @override
  Future<List<dynamic>> findCouriers(double lat, double lng) async {
    try {
      final response = await _dio.post(
        '/operation/logistics/find',
        data: {'lat': lat, 'lng': lng},
      );
      return response.data;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<bool> sendContactMessage(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/contact', data: data);
      return response.data['success'] == true;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getNotifications(String userId) async {
    try {
      final response = await _dio.get('/notifications/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> markNotificationRead(String notificationId) async {
    try {
      await _dio.patch('/notifications/$notificationId/read');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> markAllNotificationsRead(String userId) async {
    try {
      await _dio.patch('/notifications/$userId/read-all');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      await _dio.patch('/user/password', data: {'currentPassword': currentPassword, 'newPassword': newPassword});
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getNotificationPreferences() async {
    try {
      final r = await _dio.get('/user/notification-preferences');
      return Map<String, dynamic>.from(r.data as Map);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> updateNotificationPreferences(Map<String, bool> prefs) async {
    try {
      final r = await _dio.put('/user/notification-preferences', data: prefs);
      return Map<String, dynamic>.from(r.data as Map);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final errorData = e.response?.data;
      if (errorData is Map && errorData.containsKey('error')) {
        return Exception(errorData['error']);
      }
    }
    return Exception('Bağlantı hatası: ${e.message}');
  }
}
