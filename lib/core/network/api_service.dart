import 'dart:io' show Platform;

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:path_provider/path_provider.dart';

/// Builds the persistent cookie jar used for the gateway's HttpOnly session
/// cookie. Must be awaited once in main() before runApp, then supplied to
/// [apiServiceProvider] via ProviderScope overrides — this keeps the
/// provider itself synchronous so every repository/viewmodel that depends
/// on it does not need to become async.
Future<CookieJar> createPersistentCookieJar() async {
  final appDir = await getApplicationDocumentsDirectory();
  return PersistCookieJar(storage: FileStorage('${appDir.path}/.cookies'));
}

final apiServiceProvider = Provider<IApiService>((ref) {
  throw UnimplementedError(
    'apiServiceProvider must be overridden in main() with a resolved CookieJar '
    '(see createPersistentCookieJar).',
  );
});

class ApiService implements IApiService {
  // Gateway is the single entry point (port 3000). The host address depends
  // on where the app runs, so it's chosen automatically:
  //   - Android emulator          -> 10.0.2.2 (its alias for the host machine)
  //   - iOS Simulator / macOS     -> localhost (they share the host network)
  // A physical device can't reach either, so pass your machine's LAN IP via
  //   --dart-define=API_BASE_URL=http://192.168.x.x:3000/api
  // When that define is set it always wins, overriding the auto-detection.
  static const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');

  static String get baseUrl {
    if (_envBaseUrl.isNotEmpty) return _envBaseUrl;
    final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    return 'http://$host:3000/api';
  }

  final Dio _dio;

  ApiService({required CookieJar cookieJar})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      )..interceptors.add(CookieManager(cookieJar));

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/gateway/login',
        data: {'email': email, 'password': password},
      );
      return response.data;
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
        '/auth/register',
        data: {'email': email, 'password': password, 'fullName': fullName},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUser() async {
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
    try {
      await _dio.post('/gateway/logout');
    } on DioException catch (e) {
      throw _handleError(e);
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
