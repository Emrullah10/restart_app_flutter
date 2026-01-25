import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/home/riverpod/activity_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class ProfileActivityList extends ConsumerWidget {
  const ProfileActivityList({super.key});

  IconData _getIconForType(String? type) {
    switch (type) {
      case 'recycle':
        return LucideIcons.smartphone;
      case 'badge':
        return LucideIcons.trophy;
      case 'repair':
        return LucideIcons.wrench;
      case 'sell':
        return LucideIcons.dollarSign;
      default:
        return LucideIcons.leaf;
    }
  }

  Color _getColorForType(String? type) {
    switch (type) {
      case 'recycle':
        return const Color(0xFF059669);
      case 'badge':
        return const Color(0xFF2563EB);
      case 'repair':
        return const Color(0xFF7C3AED);
      case 'sell':
        return const Color(0xFFF97316);
      default:
        return const Color(0xFF10B981);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityState = ref.watch(activityProvider);
    final activities = activityState.activities;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.recentActivityTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          if (activityState.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF22C55E)),
            )
          else if (activities.isEmpty)
            Text(
              'Henüz aktivite yok',
              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            )
          else
            ...activities.take(3).map((activity) {
              final type = activity['type'] as String?;
              final title = activity['title'] ?? '';
              final description = activity['description'] ?? '';
              final pointsEarned = activity['pointsEarned'] ?? 0;

              return Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: _buildActivityItem(
                  icon: _getIconForType(type),
                  title: title,
                  subtitle: pointsEarned > 0
                      ? '+$pointsEarned puan'
                      : description,
                  color: _getColorForType(type),
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20.sp),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
}
