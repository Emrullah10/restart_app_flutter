import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:mobile_flutter/features/rewards/data/models/reward.dart';
import 'package:mobile_flutter/features/rewards/presentation/viewmodel/rewards_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

const List<IconData> _kRewardIcons = [
  LucideIcons.gift,
  LucideIcons.shoppingBag,
  LucideIcons.coffee,
];
const List<Color> _kRewardColors = [
  Color(0xFF7F1D1D),
  Color(0xFF1F2937),
  Color(0xFF065F46),
];

class RewardsSection extends ConsumerWidget {
  const RewardsSection({super.key});

  Future<void> _handleRedeem(
    BuildContext context,
    WidgetRef ref,
    Reward reward,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(reward.title),
        content: Text('${reward.pointsCost} puan karşılığında kullanılsın mı?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(context.l10n.useButton),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final success = await ref
        .read(rewardsViewModelProvider.notifier)
        .redeem(reward.id);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? '${reward.title} kullanıldı!' : 'Ödül kullanılamadı',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsAsync = ref.watch(rewardsViewModelProvider);
    final totalPoints =
        ref.watch(profileViewModelProvider).valueOrNull?.totalPoints ?? 0;
    final rewards = rewardsAsync.valueOrNull ?? const [];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.rewardsTitle,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.l10n.brandCollaborations,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        if (rewardsAsync.isLoading)
          const Center(child: CircularProgressIndicator())
        else
          ...rewards.asMap().entries.map((entry) {
            final index = entry.key;
            final reward = entry.value;
            final canAfford = totalPoints >= reward.pointsCost;
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildRewardItem(
                context,
                icon: _kRewardIcons[index % _kRewardIcons.length],
                iconColor: Colors.white,
                bgColor: _kRewardColors[index % _kRewardColors.length],
                title: reward.title,
                subtitle: reward.subtitle,
                points: '${reward.pointsCost} puan',
                buttonText: canAfford
                    ? context.l10n.useButton
                    : context.l10n.insufficientPoints,
                buttonColor: canAfford
                    ? const Color(0xFF3B82F6)
                    : Colors.transparent,
                onTap: canAfford
                    ? () => _handleRedeem(context, ref, reward)
                    : null,
                textColor: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            );
          }),
      ],
    );
  }

  Widget _buildRewardItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String subtitle,
    required String points,
    required String buttonText,
    required Color buttonColor,
    required VoidCallback? onTap,
    Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: context.isDarkMode
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: context.isDarkMode
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: TextStyle(
                  color: const Color(0xFFF97316),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              if (onTap != null)
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 12.sp),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
