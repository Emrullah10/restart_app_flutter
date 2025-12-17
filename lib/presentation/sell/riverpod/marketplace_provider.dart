import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';
import 'package:mobile_flutter/data/services/i_api_service.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';

// ==================== USER LISTINGS ====================
class ListingsState {
  final bool isLoading;
  final String? error;
  final List<dynamic> listings;

  ListingsState({this.isLoading = false, this.error, this.listings = const []});

  ListingsState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? listings,
  }) {
    return ListingsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      listings: listings ?? this.listings,
    );
  }
}

class ListingsNotifier extends StateNotifier<ListingsState> {
  final IApiService _apiService;
  final String? _userId;

  ListingsNotifier(this._apiService, this._userId) : super(ListingsState()) {
    if (_userId != null) {
      loadListings();
    }
  }

  Future<void> loadListings() async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getUserListings(_userId);
      state = state.copyWith(isLoading: false, listings: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final listingsProvider =
    StateNotifierProvider.autoDispose<ListingsNotifier, ListingsState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      final authState = ref.watch(authProvider);
      final userId = authState.user?['id'];

      return ListingsNotifier(apiService, userId?.toString());
    });

// ==================== MARKETPLACE PRODUCTS ====================
class ProductsState {
  final bool isLoading;
  final String? error;
  final List<dynamic> products;

  ProductsState({this.isLoading = false, this.error, this.products = const []});

  ProductsState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? products,
  }) {
    return ProductsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      products: products ?? this.products,
    );
  }
}

class ProductsNotifier extends StateNotifier<ProductsState> {
  final IApiService _apiService;

  ProductsNotifier(this._apiService) : super(ProductsState()) {
    loadProducts();
  }

  Future<void> loadProducts({String? category, int? limit}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _apiService.getProducts(
        category: category,
        limit: limit,
      );
      state = state.copyWith(isLoading: false, products: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final productsProvider =
    StateNotifierProvider.autoDispose<ProductsNotifier, ProductsState>((ref) {
      final apiService = ref.watch(apiServiceProvider);
      return ProductsNotifier(apiService);
    });
