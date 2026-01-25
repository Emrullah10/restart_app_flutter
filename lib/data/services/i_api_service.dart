import 'package:mobile_flutter/data/models/models.dart';

abstract class IApiService {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String fullName,
  );

  // Recycle
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data);
  Future<List<dynamic>> getRecycleHistory(String userId);

  // User
  Future<UserProfileModel> getUserProfile(String userId);

  // Activities
  Future<List<ActivityModel>> getActivities(String userId, {int limit = 10});

  // Gamification
  Future<Map<String, dynamic>> getLeaderboard({String? userId, int limit = 3});
  Future<List<BadgeModel>> getUserBadges(String userId);

  // Marketplace
  Future<List<ListingModel>> getUserListings(String userId);
  Future<List<ProductModel>> getProducts({String? category, int? limit});

  // Rewards
  Future<List<RewardModel>> getRewards();

  // Services
  Future<List<ServiceModel>> getServices({String? type});

  /// PostGIS ile yakındaki servis merkezlerini getirir
  Future<List<ServiceModel>> getNearbyServices({
    required double lat,
    required double lng,
    int radiusMeters = 5000,
    String? type,
  });

  Future<Map<String, dynamic>> getMotivationMessage(
    String productModel,
    String condition,
  );

  /// PostGIS ile yakındaki kuryeleri getirir
  Future<List<dynamic>> findCouriers({
    required double lat,
    required double lng,
    int radiusMeters = 3000,
    String? vehicleType,
    bool electricOnly = false,
  });

  Future<bool> sendContactMessage(Map<String, dynamic> data);
}
