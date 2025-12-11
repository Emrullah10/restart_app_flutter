import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/data/services/i_api_service.dart';

final apiServiceProvider = Provider<IApiService>((ref) => ApiService());

class ApiService implements IApiService {
  // Android Emulator uses 10.0.2.2 to access localhost of the host machine.
  static const String baseUrl = 'http://10.0.2.2:3000';

  @override
  Future<Map<String, dynamic>> getMotivationMessage(
    String productModel,
    String condition,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/ai/generate-motivation'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'productModel': productModel,
          'condition': condition,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load motivation message');
      }
    } catch (e) {
      print('API Error: $e');
      return {'message': 'Hata oluştu, lütfen tekrar deneyin.', 'savings': 0};
    }
  }

  @override
  Future<List<dynamic>> findCouriers(double lat, double lng) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logistics/find'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'lat': lat, 'lng': lng}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to find couriers');
      }
    } catch (e) {
      print('API Error: $e');
      return [];
    }
  }

  @override
  Future<bool> sendContactMessage(Map<String, dynamic> data) async {
    // Simulating API call since backend might not have this endpoint yet.
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
