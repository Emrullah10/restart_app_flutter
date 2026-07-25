abstract class IApiService {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String fullName,
  );

  /// Restores the session from the persisted auth cookie, if any.
  /// Returns the current user map, or null if there is no valid session.
  Future<Map<String, dynamic>?> getCurrentUser();
  Future<void> logout();

  // Recycle
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data);
  Future<List<dynamic>> getRecycleHistory(String userId);

  // User
  Future<Map<String, dynamic>> getUserProfile(String userId);

  // Activities
  Future<List<dynamic>> getActivities(String userId, {int limit = 10});

  // Gamification
  Future<Map<String, dynamic>> getLeaderboard({String? userId, int limit = 3});
  Future<List<dynamic>> getUserBadges(String userId);

  // Marketplace
  Future<List<dynamic>> getUserListings(String userId);
  Future<List<dynamic>> getProducts({String? category, int? limit});
  Future<List<String>> uploadListingImages(List<String> filePaths);
  Future<Map<String, dynamic>> createListing(Map<String, dynamic> data);

  // Rewards
  Future<List<dynamic>> getRewards();
  Future<Map<String, dynamic>> redeemReward(String userId, String rewardId);

  // Services
  Future<List<dynamic>> getServices({String? type});

  Future<Map<String, dynamic>> getMotivationMessage(
    String productModel,
    String condition,
  );
  Future<List<dynamic>> findCouriers(double lat, double lng);
  Future<bool> sendContactMessage(Map<String, dynamic> data);

  // Notifications
  Future<List<dynamic>> getNotifications(String userId);
  Future<void> markNotificationRead(String notificationId);
  Future<void> markAllNotificationsRead(String userId);
}
