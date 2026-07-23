import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class ProfileStatsRow extends StatelessWidget {
  final String points;
  final String recycleCount;

  const ProfileStatsRow({
    super.key,
    required this.points,
    required this.recycleCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: LucideIcons.smartphone,
              value: recycleCount,
              label: context.l10n.statTotalDevices,
              color: const Color(0xFF3B82F6), // Blue
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildStatCard(
              icon: LucideIcons.coins,
              value: points,
              label: context.l10n.statPointsEarned,
              color: const Color(0xFF22C55E), // Green
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
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
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(color: Colors.grey[400], fontSize: 10.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
