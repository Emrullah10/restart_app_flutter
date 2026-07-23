import 'package:mobile_flutter/features/profile/data/models/leaderboard.dart';
import 'package:mobile_flutter/features/profile/data/models/user_badge.dart';
import 'package:mobile_flutter/features/profile/data/models/user_profile.dart';

abstract interface class ProfileRepository {
  Future<UserProfile> getProfile(String userId);
  Future<List<UserBadge>> getBadges(String userId);
  Future<Leaderboard> getLeaderboard({String? userId, int limit = 3});
}
