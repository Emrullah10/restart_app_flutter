import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

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
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildAchievementCard(
                icon: LucideIcons.star,
                title: context.l10n.achievementFirstRepair,
                subtitle: context.l10n.achievementCompleted,
                isCompleted: true,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAchievementCard(
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
                icon: LucideIcons.trophy,
                title: context.l10n.achievementSuperSeller,
                subtitle: '${context.l10n.achievementFiftySales} (12/50)',
                isCompleted: false,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAchievementCard(
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

  Widget _buildAchievementCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isCompleted
              ? const Color(0xFF10B981).withOpacity(0.3)
              : Colors.white.withOpacity(0.05),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: isCompleted ? Colors.white : Colors.grey[600],
            size: 32.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              color: isCompleted ? Colors.white : Colors.grey[400],
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
