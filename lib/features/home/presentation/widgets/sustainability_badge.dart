import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SustainabilityBadge extends StatelessWidget {
  const SustainabilityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF22C55E).withOpacity(0.1),
        border: Border.all(color: const Color(0xFF22C55E).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.leaf, size: 14.sp, color: const Color(0xFF4ADE80)),
          SizedBox(width: 8.w),
          Text(
            'Sürdürülebilir Teknoloji',
            style: TextStyle(
              color: const Color(0xFF4ADE80),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
