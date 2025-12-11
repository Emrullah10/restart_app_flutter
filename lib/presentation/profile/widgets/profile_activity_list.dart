import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileActivityList extends StatelessWidget {
  const ProfileActivityList({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Son Aktiviteler',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          _buildActivityItem(
            icon: LucideIcons.smartphone,
            title: 'iPhone 12 Pro onardın',
            subtitle: '2 saat önce • +50 puan',
            color: const Color(0xFF059669), // Greenish
          ),
          SizedBox(height: 24.h),
          _buildActivityItem(
            icon: LucideIcons.trophy,
            title: 'Yeni rozet kazandın',
            subtitle: '1 gün önce',
            color: const Color(0xFF2563EB), // Blue
          ),
          SizedBox(height: 24.h),
          _buildActivityItem(
            icon: LucideIcons.leaf,
            title: '5kg CO₂ tasarrufu',
            subtitle: '2 gün önce',
            color: const Color(0xFF10B981), // Emerald
          ),
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
