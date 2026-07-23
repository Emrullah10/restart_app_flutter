import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:mobile_flutter/shared/extensions/padding_extensions.dart';

class ActionButtonsGrid extends StatelessWidget {
  const ActionButtonsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.horizontalP,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionCard(
            icon: LucideIcons.wrench,
            title: context.l10n.homeActionRepair,
            subtitle: context.l10n.homeActionRepairSub,
            color: const Color(0xFF3B82F6), // Blue
            onTap: () {
              context.push(Routes.repair);
            },
          ),
          _buildActionCard(
            icon: LucideIcons.tag,
            title: context.l10n.homeActionSell,
            subtitle: context.l10n.homeActionSellSub,
            color: const Color(0xFFF59E0B), // Amber
            onTap: () {
              context.go(Routes.sell);
            },
          ),
          _buildActionCard(
            icon: LucideIcons.recycle,
            title: context.l10n.homeActionRecycle,
            subtitle: context.l10n.homeActionRecycleSub,
            color: const Color(0xFF22C55E), // Green
            onTap: () {
              context.go(Routes.recycle);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105.w,
        height: 180.h,
        padding: 12.allP,
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.sp,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
