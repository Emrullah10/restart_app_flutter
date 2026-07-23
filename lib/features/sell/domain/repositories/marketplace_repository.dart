import 'package:mobile_flutter/features/sell/data/models/listing.dart';
import 'package:mobile_flutter/features/sell/data/models/marketplace_product.dart';

abstract interface class MarketplaceRepository {
  Future<List<Listing>> getUserListings(String userId);
  Future<List<MarketplaceProduct>> getProducts({String? category, int? limit});
}
