import 'package:teknolup/features/sell/data/models/listing.dart';
import 'package:teknolup/features/sell/data/models/marketplace_product.dart';

abstract interface class MarketplaceRepository {
  Future<List<Listing>> getUserListings(String userId);
  Future<List<MarketplaceProduct>> getProducts({String? category, int? limit});
  Future<List<String>> uploadListingImages(List<String> filePaths);
  Future<void> createListing({
    required String userId,
    required String title,
    required String description,
    required String category,
    required double price,
    required String location,
    List<String> images,
  });
}
