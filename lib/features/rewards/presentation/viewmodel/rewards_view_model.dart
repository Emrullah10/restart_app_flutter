import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:mobile_flutter/features/rewards/data/models/reward.dart';
import 'package:mobile_flutter/features/rewards/data/repositories/rewards_repository_impl.dart';

class RewardsViewModel extends AutoDisposeAsyncNotifier<List<Reward>> {
  @override
  Future<List<Reward>> build() {
    return ref.watch(rewardsRepositoryProvider).getRewards();
  }

  Future<bool> redeem(String rewardId) async {
    final userId = ref.read(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return false;
    try {
      await ref.read(rewardsRepositoryProvider).redeemReward(userId, rewardId);
      ref.invalidate(profileViewModelProvider);
      return true;
    } catch (_) {
      return false;
    }
  }
}

final rewardsViewModelProvider =
    AutoDisposeAsyncNotifierProvider<RewardsViewModel, List<Reward>>(
      RewardsViewModel.new,
    );
