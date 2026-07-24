import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.achievementsTitle,
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildAchievementCard(
                context,
                icon: LucideIcons.star,
                title: context.l10n.achievementFirstRepair,
                subtitle: context.l10n.achievementCompleted,
                isCompleted: true,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAchievementCard(
                context,
                icon: LucideIcons.leaf,
                title: context.l10n.achievementEnvironmentalist,
                subtitle: context.l10n.achievementTenRecycles,
                isCompleted: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildAchievementCard(
                context,
                icon: LucideIcons.trophy,
                title: context.l10n.achievementSuperSeller,
                subtitle: '${context.l10n.achievementFiftySales} (12/50)',
                isCompleted: false,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAchievementCard(
                context,
                icon: LucideIcons.crown,
                title: context.l10n.achievementGoldLevel,
                subtitle: context.l10n.achievementReachPoints,
                isCompleted: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    final Color secondaryText = context.isDarkMode
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isCompleted
              ? const Color(0xFF10B981).withOpacity(0.3)
              : context.theme.dividerColor.withOpacity(0.05),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: isCompleted ? const Color(0xFF10B981) : secondaryText,
            size: 32.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              color: isCompleted
                  ? (context.isDarkMode
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight)
                  : secondaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(color: secondaryText, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
