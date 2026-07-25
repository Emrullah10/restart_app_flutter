import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/activity_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class ProfileActivityList extends ConsumerWidget {
  const ProfileActivityList({super.key});

  IconData _iconForType(String type) {
    switch (type) {
      case 'recycle':
        return LucideIcons.recycle;
      case 'repair':
        return LucideIcons.smartphone;
      case 'sell':
        return LucideIcons.shoppingCart;
      case 'badge':
        return LucideIcons.trophy;
      default:
        return LucideIcons.leaf;
    }
  }

  Color _colorForType(String type) {
    switch (type) {
      case 'recycle':
        return const Color(0xFF10B981);
      case 'repair':
        return const Color(0xFF059669);
      case 'badge':
        return const Color(0xFF2563EB);
      default:
        return const Color(0xFF10B981);
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) return '${difference.inMinutes} dk önce';
    if (difference.inHours < 24) return '${difference.inHours} saat önce';
    return '${difference.inDays} gün önce';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(activityViewModelProvider);
    final activities = activityAsync.valueOrNull ?? const [];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.recentActivityTitle,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          if (activityAsync.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (activities.isEmpty)
            Text(
              'Henüz aktivite yok',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 14.sp,
              ),
            )
          else
            ...activities.take(3).map(
                  (activity) => Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: _buildActivityItem(
                      context,
                      icon: _iconForType(activity.type),
                      title: activity.title,
                      subtitle:
                          '${_formatTimeAgo(activity.createdAt)} • +${activity.pointsEarned} puan',
                      color: _colorForType(activity.type),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
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
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
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
      ],
    );
  }
}
