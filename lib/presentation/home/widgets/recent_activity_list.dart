import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/home/riverpod/activity_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

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
    final activityState = ref.watch(activityProvider);
    final activities = activityState.activities;

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
                  color: Colors.white,
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
        if (activityState.isLoading)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: const CircularProgressIndicator(color: Color(0xFF22C55E)),
          )
        else if (activities.isEmpty)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Text(
              'Henüz aktivite yok',
              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            ),
          )
        else
          ...activities.take(3).map((activity) {
            final type = activity['type'] ?? 'default';
            final title = activity['title'] ?? '';
            final points = activity['pointsEarned'] ?? 0;
            final amount = activity['amountEarned'] ?? 0.0;
            final createdAt =
                DateTime.tryParse(activity['createdAt'] ?? '') ??
                DateTime.now();
            final timeAgo = _formatTimeAgo(createdAt);

            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildActivityItem(
                icon: _getIconForType(type),
                title: title,
                subtitle: '$timeAgo • +$points puan',
                amount: amount > 0 ? '+₺${amount.toStringAsFixed(0)}' : '',
                color: _getColorForType(type),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildActivityItem({
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
        color: const Color(0xFF1F2937),
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
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
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
