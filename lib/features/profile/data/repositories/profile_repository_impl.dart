import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/profile/data/models/leaderboard.dart';
import 'package:mobile_flutter/features/profile/data/models/user_badge.dart';
import 'package:mobile_flutter/features/profile/data/models/user_profile.dart';
import 'package:mobile_flutter/features/profile/domain/repositories/profile_repository.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

class ProfileRepositoryImpl implements ProfileRepository {
  final IApiService _api;
  ProfileRepositoryImpl(this._api);

  @override
  Future<UserProfile> getProfile(String userId) async {
    final json = await _api.getUserProfile(userId);
    return UserProfile(
      fullName: json['fullName']?.toString() ?? 'User',
      role: json['role']?.toString() ?? 'Member',
      totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
      recycleCount: (json['recycleCount'] as num?)?.toInt() ?? 0,
      co2Saved: json['co2Saved']?.toString() ?? '0.0',
      repairedCount: (json['repairedCount'] as num?)?.toInt() ?? 0,
      preventedWasteKg: _parseDouble(json['preventedWasteKg']),
      totalEarnings: _parseDouble(json['totalEarnings']),
      level: (json['level'] as num?)?.toInt() ?? 1,
    );
  }

  @override
  Future<List<UserBadge>> getBadges(String userId) async {
    final data = await _api.getUserBadges(userId);
    return data.map((raw) {
      final badge = raw as Map<String, dynamic>;
      return UserBadge(
        name: badge['name']?.toString() ?? '',
        icon: badge['icon']?.toString(),
        color: badge['color']?.toString(),
        isUnlocked: badge['isUnlocked'] == true,
      );
    }).toList();
  }

  @override
  Future<Leaderboard> getLeaderboard({String? userId, int limit = 3}) async {
    final data = await _api.getLeaderboard(userId: userId, limit: limit);
    final topUsersRaw = (data['topUsers'] as List?) ?? const [];
    final topUsers = topUsersRaw.asMap().entries.map((entry) {
      final user = entry.value as Map<String, dynamic>;
      return LeaderboardEntry(
        rank: (user['rank'] as num?)?.toInt() ?? entry.key + 1,
        fullName: user['fullName']?.toString() ?? 'User',
        totalPoints: (user['totalPoints'] as num?)?.toInt() ?? 0,
      );
    }).toList();

    final currentUserRaw = data['currentUser'] as Map<String, dynamic>?;
    final currentUser = currentUserRaw == null
        ? null
        : LeaderboardEntry(
            rank: (currentUserRaw['rank'] as num?)?.toInt() ?? 1,
            fullName: currentUserRaw['fullName']?.toString() ?? 'User',
            totalPoints: (currentUserRaw['totalPoints'] as num?)?.toInt() ?? 0,
          );

    return Leaderboard(topUsers: topUsers, currentUser: currentUser);
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepositoryImpl(ref.watch(apiServiceProvider)),
);
