import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PointsBreakdownRow extends StatelessWidget {
  const PointsBreakdownRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPointCard(
            icon: LucideIcons.wrench,
            color: const Color(0xFF3B82F6), // Blue
            points: '+10',
            label: 'Onarım',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildPointCard(
            icon: LucideIcons.tag,
            color: const Color(0xFF10B981), // Green
            points: '+5',
            label: 'Satış',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildPointCard(
            icon: LucideIcons.recycle,
            color: const Color(0xFFF97316), // Orange
            points: '+8',
            label: 'Dönüştürme',
          ),
        ),
      ],
    );
  }

  Widget _buildPointCard({
    required IconData icon,
    required Color color,
    required String points,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            points,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
