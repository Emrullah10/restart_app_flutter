import 'package:teknolup/features/rewards/data/models/reward.dart';

abstract interface class RewardsRepository {
  Future<List<Reward>> getRewards();
  Future<int> redeemReward(String userId, String rewardId);
}
