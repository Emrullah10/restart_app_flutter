import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/rewards/riverpod/gamification_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class AchievementsSection extends ConsumerWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamificationState = ref.watch(gamificationProvider);
    final badges = gamificationState.badges;

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
        if (gamificationState.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (badges.isEmpty)
          Center(
            child: Text(
              'Henüz başarı kazanılmadı.',
              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.85,
            ),
            itemCount: badges.length,
            itemBuilder: (context, index) {
              final badge = badges[index];
              return _buildAchievementCard(
                icon: _getIconForBadge(badge.name),
                title: badge.name,
                subtitle: badge.description,
                isCompleted: badge.isUnlocked,
              );
            },
          ),
      ],
    );
  }

  IconData _getIconForBadge(String badgeName) {
    final name = badgeName.toLowerCase();
    if (name.contains('tamir')) return LucideIcons.star;
    if (name.contains('çevreci')) return LucideIcons.leaf;
    if (name.contains('satıcı')) return LucideIcons.trophy;
    if (name.contains('altın')) return LucideIcons.crown;
    return LucideIcons.award;
  }

  Widget _buildAchievementCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isCompleted ? const Color(0xFF10B981) : Colors.grey[600],
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyle(
              color: isCompleted ? Colors.white : Colors.grey[400],
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[500], fontSize: 11.sp),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
