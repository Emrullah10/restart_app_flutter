import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';

class ServicesState {
  final bool isLoading;
  final String? error;
  final List<dynamic> services;

  ServicesState({this.isLoading = false, this.error, this.services = const []});

  ServicesState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? services,
  }) {
    return ServicesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      services: services ?? this.services,
    );
  }
}

class ServicesNotifier extends StateNotifier<ServicesState> {
  final IApiService _apiService;

  ServicesNotifier(this._apiService) : super(ServicesState()) {
    loadServices();
  }

  Future<void> loadServices({String? type}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getServices(type: type);
      state = state.copyWith(isLoading: false, services: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final servicesProvider =
    StateNotifierProvider.autoDispose<ServicesNotifier, ServicesState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      return ServicesNotifier(apiService);
    });
