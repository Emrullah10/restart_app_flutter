import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/api_service.dart';
import 'package:teknolup/core/network/i_api_service.dart';
import 'package:teknolup/features/sell/data/models/listing.dart';
import 'package:teknolup/features/sell/data/models/marketplace_product.dart';
import 'package:teknolup/features/sell/domain/repositories/marketplace_repository.dart';

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
        id: json['id']?.toString(),
        title: json['title']?.toString() ?? '',
        // Backend field is "description" (listing.entity.js), no "subtitle".
        subtitle: json['description']?.toString() ?? '',
        price: _parseDouble(json['price']),
        status: json['status']?.toString() ?? 'active',
        images: _resolveImageUrls(json['images']),
      );
    }).toList();
  }

  /// Backend returns paths relative to the API root (e.g. "/marketplace/uploads/x.jpg")
  /// so they work regardless of which host (emulator alias, LAN IP, prod) resolved baseUrl.
  String _absoluteUrl(String url) =>
      url.startsWith('http') ? url : '${ApiService.baseUrl}$url';

  List<String> _resolveImageUrls(dynamic rawImages) {
    if (rawImages is! List) return const [];
    return rawImages.map((url) => _absoluteUrl(url.toString())).toList();
  }

  @override
  Future<List<String>> uploadListingImages(List<String> filePaths) async {
    final relativeUrls = await _api.uploadListingImages(filePaths);
    return relativeUrls.map(_absoluteUrl).toList();
  }

  @override
  Future<void> createListing({
    required String userId,
    required String title,
    required String description,
    required String category,
    required double price,
    required String location,
    List<String> images = const [],
  }) async {
    final relativeImages = images
        .map((url) => url.startsWith(ApiService.baseUrl)
            ? url.substring(ApiService.baseUrl.length)
            : url)
        .toList();
    await _api.createListing({
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'location': location,
      'images': relativeImages,
    });
  }

  @override
  Future<List<MarketplaceProduct>> getProducts({
    String? category,
    int? limit,
  }) async {
    final data = await _api.getProducts(category: category, limit: limit);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      final imgs = _resolveImageUrls(json['images']);
      final single = json['imageUrl']?.toString();
      return MarketplaceProduct(
        id: json['id']?.toString(),
        category: json['category']?.toString() ?? '',
        imageUrl: imgs.isNotEmpty ? imgs.first : (single == null || single.isEmpty ? null : _absoluteUrl(single)),
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
