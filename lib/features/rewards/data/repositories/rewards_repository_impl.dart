import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/rewards/data/models/reward.dart';
import 'package:mobile_flutter/features/rewards/domain/repositories/rewards_repository.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  final IApiService _api;
  RewardsRepositoryImpl(this._api);

  @override
  Future<List<Reward>> getRewards() async {
    final data = await _api.getRewards();
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      return Reward(
        id: json['id']?.toString() ?? '',
        title: json['title']?.toString() ?? '',
        subtitle: json['subtitle']?.toString() ?? '',
        pointsCost: (json['pointsCost'] as num?)?.toInt() ?? 0,
      );
    }).toList();
  }

  @override
  Future<int> redeemReward(String userId, String rewardId) async {
    final result = await _api.redeemReward(userId, rewardId);
    return (result['remainingPoints'] as num?)?.toInt() ?? 0;
  }
}

final rewardsRepositoryProvider = Provider<RewardsRepository>(
  (ref) => RewardsRepositoryImpl(ref.watch(apiServiceProvider)),
);
