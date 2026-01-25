import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/data/models/reward_model.dart';
import 'package:mobile_flutter/presentation/profile/riverpod/profile_provider.dart';
import 'package:mobile_flutter/presentation/rewards/riverpod/rewards_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class RewardsSection extends ConsumerWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsState = ref.watch(rewardsProvider);
    final profileState = ref.watch(profileProvider);
    final userPoints = profileState.profile?.totalPoints ?? 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.rewardsTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.l10n.brandCollaborations,
              style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        if (rewardsState.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (rewardsState.error != null)
          Center(
            child: Text(
              rewardsState.error!,
              style: const TextStyle(color: Colors.red),
            ),
          )
        else
          ...rewardsState.rewards.map(
            (reward) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildRewardItem(
                context: context,
                reward: reward,
                hasEnoughPoints: userPoints >= reward.pointsRequired,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRewardItem({
    required BuildContext context,
    required RewardModel reward,
    required bool hasEnoughPoints,
  }) {
    // Determine icon and color based on partner name (Simplified mapping)
    IconData icon = LucideIcons.gift;
    Color bgColor = const Color(0xFF1F2937);

    if (reward.partnerName.toLowerCase().contains('mediamarkt')) {
      bgColor = const Color(0xFF7F1D1D);
    } else if (reward.partnerName.toLowerCase().contains('migros')) {
      icon = LucideIcons.shoppingBag;
      bgColor = const Color(0xFFF97316);
    } else if (reward.partnerName.toLowerCase().contains('starbucks')) {
      icon = LucideIcons.coffee;
      bgColor = const Color(0xFF065F46);
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward.partnerName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  reward.title,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${reward.pointsRequired} puan',
                style: TextStyle(
                  color: const Color(0xFFF97316),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              if (hasEnoughPoints)
                GestureDetector(
                  onTap: () {
                    // TODO: Implement reward usage
                  },
                  child: Text(
                    context.l10n.useButton,
                    style: TextStyle(
                      color: const Color(0xFF3B82F6),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                Text(
                  context.l10n.insufficientPoints,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
