import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/models/models.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

/// Kullanıcının mevcut konumu (Geolocator paketi ile alınacak)
/// Şimdilik İstanbul merkez koordinatları varsayılan
final userLocationProvider = StateProvider<({double lat, double lng})>((ref) {
  return (lat: 41.0082, lng: 28.9784); // İstanbul varsayılan
});

class ServicesState {
  final bool isLoading;
  final String? error;
  final List<ServiceModel> services;
  final String? selectedType; // 'recycle', 'repair', 'sell'

  ServicesState({
    this.isLoading = false,
    this.error,
    this.services = const [],
    this.selectedType,
  });

  ServicesState copyWith({
    bool? isLoading,
    String? error,
    List<ServiceModel>? services,
    String? selectedType,
  }) {
    return ServicesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      services: services ?? this.services,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}

class ServicesNotifier extends StateNotifier<ServicesState> {
  final IApiService _apiService;
  final double _lat;
  final double _lng;

  ServicesNotifier(this._apiService, this._lat, this._lng)
    : super(ServicesState()) {
    loadNearbyServices();
  }

  /// Yakındaki servis merkezlerini yükler (PostGIS)
  Future<void> loadNearbyServices({
    String? type,
    int radiusMeters = 10000,
  }) async {
    state = state.copyWith(isLoading: true, error: null, selectedType: type);
    try {
      final data = await _apiService.getNearbyServices(
        lat: _lat,
        lng: _lng,
        radiusMeters: radiusMeters,
        type: type,
      );
      state = state.copyWith(isLoading: false, services: data);
    } catch (e) {
      // Fallback: PostGIS yoksa normal servisleri yükle
      try {
        final fallbackData = await _apiService.getServices(type: type);
        state = state.copyWith(isLoading: false, services: fallbackData);
      } catch (e2) {
        state = state.copyWith(isLoading: false, error: e2.toString());
      }
    }
  }

  /// Tip filtreleme
  void filterByType(String? type) {
    loadNearbyServices(type: type);
  }
}

final servicesProvider =
    StateNotifierProvider.autoDispose<ServicesNotifier, ServicesState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      final location = ref.watch(userLocationProvider);
      return ServicesNotifier(apiService, location.lat, location.lng);
    });
