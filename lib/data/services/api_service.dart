import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

final apiServiceProvider = Provider<IApiService>((ref) => ApiService());

class ApiService implements IApiService {
  // For Android Emulator: use 10.0.2.2
  // For Physical Device: use your computer's local IP (e.g., 192.168.x.x)
  // Check your IP with: ipconfig (Windows) or ifconfig (Mac/Linux)
  static String get baseUrl {
    // If running on Android emulator, use 10.0.2.2
    // For physical device, change this to your computer's local IP
    const emulatorUrl = 'http://10.0.2.2:3001/api';
    const physicalDeviceUrl =
        'http://192.168.1.108:3001/api'; // <-- CHANGE THIS TO YOUR IP

    // You can toggle this based on your testing needs
    // For now, using emulator URL. Change to physicalDeviceUrl for real phone
    return physicalDeviceUrl;
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3001/api', // Will be overridden
      connectTimeout: const Duration(seconds: 10), // Increased timeout
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  ApiService() {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
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
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/recycle/log', data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<dynamic>> getRecycleHistory(String userId) async {
    try {
      final response = await _dio.get('/recycle/history/$userId');
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
      final response = await _dio.get('/activities/$userId?limit=$limit');
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
      final queryParams = userId != null
          ? '?userId=$userId&limit=$limit'
          : '?limit=$limit';
      final response = await _dio.get('/gamification/leaderboard$queryParams');
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
      final queryParams = <String, String>{};
      if (category != null) queryParams['category'] = category;
      if (limit != null) queryParams['limit'] = limit.toString();

      final queryString = queryParams.isNotEmpty
          ? '?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}'
          : '';

      final response = await _dio.get('/marketplace/products$queryString');
      return response.data;
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
  Future<List<dynamic>> getServices({String? type}) async {
    try {
      final queryString = type != null ? '?type=$type' : '';
      final response = await _dio.get('/services$queryString');
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
        '/ai/generate-motivation',
        data: {'productModel': productModel, 'condition': condition},
      );
      return response.data;
    } catch (e) {
      print('API Error (Motivation): $e');
      return {'message': 'Hata oluştu, tekrar deneyin.', 'savings': 0};
    }
  }

  @override
  Future<List<dynamic>> findCouriers(double lat, double lng) async {
    try {
      final response = await _dio.post(
        '/logistics/find',
        data: {'lat': lat, 'lng': lng},
      );
      return response.data;
    } catch (e) {
      print('API Error (Couriers): $e');
      return [];
    }
  }

  @override
  Future<bool> sendContactMessage(Map<String, dynamic> data) async {
    // Mock for now
    await Future.delayed(const Duration(seconds: 1));
    return true;
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
