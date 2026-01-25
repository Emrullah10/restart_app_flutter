import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/models/models.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

final apiServiceProvider = Provider<IApiService>((ref) => ApiService());

class ApiService implements IApiService {
  // Microservice Base URLs
  // For Android Emulator (Standard): 10.0.2.2
  static const String _baseHost = '10.0.2.2';

  static String get iamBaseUrl => 'http://$_baseHost:3001/api/';
  static String get operationBaseUrl => 'http://$_baseHost:3002/api/';
  static String get marketplaceBaseUrl => 'http://$_baseHost:3003/api/';

  late final Dio _iamDio;
  late final Dio _operationDio;
  late final Dio _marketplaceDio;

  ApiService() {
    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
      logPrint: (obj) => print('DIO LOG: $obj'),
    );

    final connectTimeout = const Duration(seconds: 10);
    final receiveTimeout = const Duration(seconds: 10);
    final headers = {'Content-Type': 'application/json'};

    _iamDio = Dio(
      BaseOptions(
        baseUrl: iamBaseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers,
      ),
    )..interceptors.add(logInterceptor);

    _operationDio = Dio(
      BaseOptions(
        baseUrl: operationBaseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers,
      ),
    )..interceptors.add(logInterceptor);

    _marketplaceDio = Dio(
      BaseOptions(
        baseUrl: marketplaceBaseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers,
      ),
    )..interceptors.add(logInterceptor);
  }

  // ==================== IAM Service ====================

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _iamDio.post(
        'auth/login',
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
      final response = await _iamDio.post(
        'auth/register',
        data: {'email': email, 'password': password, 'fullName': fullName},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<UserProfileModel> getUserProfile(String userId) async {
    try {
      final response = await _iamDio.get('user/profile/$userId');
      return UserProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== Operation Service ====================

  @override
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data) async {
    try {
      final response = await _operationDio.post('recycle/log', data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getRecycleHistory(String userId) async {
    try {
      final response = await _operationDio.get('recycle/history/$userId');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<ActivityModel>> getActivities(
    String userId, {
    int limit = 10,
  }) async {
    try {
      final response = await _operationDio.get(
        'activities/$userId?limit=$limit',
      );
      return (response.data as List)
          .map((json) => ActivityModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<ServiceModel>> getServices({String? type}) async {
    try {
      final queryString = type != null ? '?type=$type' : '';
      final response = await _operationDio.get('services$queryString');
      return (response.data as List)
          .map((json) => ServiceModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// PostGIS ile yakındaki servis merkezlerini getirir
  @override
  Future<List<ServiceModel>> getNearbyServices({
    required double lat,
    required double lng,
    int radiusMeters = 5000,
    String? type,
  }) async {
    try {
      final queryParams = <String, String>{
        'lat': lat.toString(),
        'lng': lng.toString(),
        'radius': radiusMeters.toString(),
      };
      if (type != null) queryParams['type'] = type;

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');

      final response = await _operationDio.get('services/nearby?$queryString');
      return (response.data as List)
          .map((json) => ServiceModel.fromJson(json))
          .toList();
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
      final response = await _operationDio.post(
        'ai/generate-motivation',
        data: {'productModel': productModel, 'condition': condition},
      );
      return response.data;
    } catch (e) {
      print('API Error (Motivation): $e');
      return {
        'message': 'Doğa için yaptığın katkı paha biçilemez!',
        'carbon': 0,
      };
    }
  }

  /// PostGIS ile yakındaki kuryeleri getirir (elektrikli öncelikli)
  @override
  Future<List<dynamic>> findCouriers({
    required double lat,
    required double lng,
    int radiusMeters = 3000,
    String? vehicleType,
    bool electricOnly = false,
  }) async {
    try {
      final response = await _operationDio.post(
        'logistics/find',
        data: {
          'lat': lat,
          'lng': lng,
          'radius': radiusMeters,
          'vehicleType': vehicleType,
          'electricOnly': electricOnly,
        },
      );
      return response.data;
    } catch (e) {
      print('API Error (Couriers): $e');
      return [];
    }
  }

  // ==================== Marketplace Service ====================

  @override
  Future<List<ListingModel>> getUserListings(String userId) async {
    try {
      final response = await _marketplaceDio.get(
        'marketplace/listings/$userId',
      );
      return (response.data as List)
          .map((json) => ListingModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<ProductModel>> getProducts({String? category, int? limit}) async {
    try {
      final queryParams = <String, String>{};
      if (category != null) queryParams['category'] = category;
      if (limit != null) queryParams['limit'] = limit.toString();

      final queryString = queryParams.isNotEmpty
          ? '?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}'
          : '';

      final response = await _marketplaceDio.get(
        'marketplace/products$queryString',
      );
      return (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== Gamification (MVP) ====================

  @override
  Future<Map<String, dynamic>> getLeaderboard({
    String? userId,
    int limit = 3,
  }) async {
    return {
      'topUsers': [
        {'fullName': 'Ahmet Y.', 'points': 1250, 'rank': 1},
        {'fullName': 'Ayşe K.', 'points': 980, 'rank': 2},
        {'fullName': 'Mehmet T.', 'points': 750, 'rank': 3},
      ],
      'userRank': null,
    };
  }

  @override
  Future<List<BadgeModel>> getUserBadges(String userId) async {
    return [];
  }

  @override
  Future<List<RewardModel>> getRewards() async {
    return [];
  }

  @override
  Future<bool> sendContactMessage(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // ==================== Helper ====================

  Exception _handleError(DioException e) {
    print('DIO ERROR: ${e.message}');
    print('DIO RESPONSE: ${e.response?.data}');
    print('DIO URL: ${e.requestOptions.uri}');

    if (e.response != null) {
      final errorData = e.response?.data;
      if (errorData is Map && errorData.containsKey('error')) {
        return Exception(errorData['error']);
      }
      if (e.response?.statusCode == 404) {
        return Exception(
          'Servis noktası bulunamadı (404). URL: ${e.requestOptions.uri}',
        );
      }
    }
    return Exception('Bağlantı hatası: ${e.message}');
  }
}
