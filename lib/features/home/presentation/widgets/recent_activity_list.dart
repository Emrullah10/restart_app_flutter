import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/activity_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecentActivityList extends ConsumerWidget {
  const RecentActivityList({super.key});

  IconData _getIconForType(String type) {
    switch (type) {
      case 'recycle':
        return LucideIcons.recycle;
      case 'repair':
        return LucideIcons.wrench;
      case 'sell':
        return LucideIcons.shoppingCart;
      case 'badge':
        return LucideIcons.award;
      default:
        return LucideIcons.checkCircle;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'recycle':
        return const Color(0xFF22C55E); // Green
      case 'repair':
        return const Color(0xFF3B82F6); // Blue
      case 'sell':
        return const Color(0xFFF97316); // Orange
      case 'badge':
        return const Color(0xFFEAB308); // Yellow
      default:
        return const Color(0xFF22C55E);
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} dk önce';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} saat önce';
    } else {
      return '${difference.inDays} gün önce';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(activityViewModelProvider);
    final activities = activityAsync.valueOrNull ?? const [];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.recentActivities,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.l10n.viewAll,
                  style: TextStyle(
                    color: const Color(0xFF22C55E),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        if (activityAsync.isLoading)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: const CircularProgressIndicator(color: Color(0xFF22C55E)),
          )
        else if (activities.isEmpty)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Text(
              'Henüz aktivite yok',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 14.sp,
              ),
            ),
          )
        else
          ...activities.take(3).map((activity) {
            final timeAgo = _formatTimeAgo(activity.createdAt);

            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildActivityItem(
                context,
                icon: _getIconForType(activity.type),
                title: activity.title,
                subtitle: '$timeAgo • +${activity.pointsEarned} puan',
                amount: activity.amountEarned > 0
                    ? '+₺${activity.amountEarned.toStringAsFixed(0)}'
                    : '',
                color: _getColorForType(activity.type),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required Color color,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.surfaceDark
            : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
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
          Text(
            amount,
            style: TextStyle(
              color: const Color(0xFF22C55E),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
