import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/profile/data/models/leaderboard.dart';
import 'package:mobile_flutter/features/profile/data/models/user_badge.dart';
import 'package:mobile_flutter/features/profile/data/repositories/profile_repository_impl.dart';

class BadgesViewModel extends AutoDisposeAsyncNotifier<List<UserBadge>> {
  @override
  Future<List<UserBadge>> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return const [];
    return ref.watch(profileRepositoryProvider).getBadges(userId);
  }
}

final badgesViewModelProvider =
    AutoDisposeAsyncNotifierProvider<BadgesViewModel, List<UserBadge>>(
      BadgesViewModel.new,
    );

class LeaderboardViewModel extends AutoDisposeAsyncNotifier<Leaderboard> {
  @override
  Future<Leaderboard> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    return ref
        .watch(profileRepositoryProvider)
        .getLeaderboard(userId: userId, limit: 3);
  }
}

final leaderboardViewModelProvider =
    AutoDisposeAsyncNotifierProvider<LeaderboardViewModel, Leaderboard>(
      LeaderboardViewModel.new,
    );
