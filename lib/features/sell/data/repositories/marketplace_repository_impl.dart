import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/sell/data/models/listing.dart';
import 'package:mobile_flutter/features/sell/data/models/marketplace_product.dart';
import 'package:mobile_flutter/features/sell/domain/repositories/marketplace_repository.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

class MarketplaceRepositoryImpl implements MarketplaceRepository {
  final IApiService _api;
  MarketplaceRepositoryImpl(this._api);

  @override
  Future<List<Listing>> getUserListings(String userId) async {
    final data = await _api.getUserListings(userId);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      return Listing(
        title: json['title']?.toString() ?? '',
        // Backend field is "description" (listing.entity.js), no "subtitle".
        subtitle: json['description']?.toString() ?? '',
        price: _parseDouble(json['price']),
        status: json['status']?.toString() ?? 'active',
      );
    }).toList();
  }

  @override
  Future<List<MarketplaceProduct>> getProducts({
    String? category,
    int? limit,
  }) async {
    final data = await _api.getProducts(category: category, limit: limit);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      return MarketplaceProduct(
        title: json['title']?.toString() ?? '',
        // Backend field is "description" (product.entity.js), no "subtitle".
        subtitle: json['description']?.toString() ?? '',
        price: _parseDouble(json['price']),
        rating: _parseDouble(json['rating']),
        location: json['location']?.toString() ?? '',
      );
    }).toList();
  }
}

final marketplaceRepositoryProvider = Provider<MarketplaceRepository>(
  (ref) => MarketplaceRepositoryImpl(ref.watch(apiServiceProvider)),
);
