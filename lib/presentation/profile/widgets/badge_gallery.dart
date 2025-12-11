import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BadgeGallery extends StatelessWidget {
  const BadgeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rozet Galerisi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBadge(
                icon: Icons.star,
                color: const Color(0xFF10B981), // Green
                label: 'İlk Cihazını\nDönüştürdün',
              ),
              _buildBadge(
                icon: LucideIcons.wrench,
                color: const Color(0xFF1D4ED8), // Blue
                label: '3 Cihaz Onardın',
              ),
              _buildBadge(
                icon: LucideIcons.recycle,
                color: const Color(0xFF7C3AED), // Purple
                label: 'Geri Dönüşüm\nUzmanı',
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBadge(
                icon: LucideIcons.flame,
                color: const Color(0xFFEA580C), // Orange
                label: '10 Günlük Seri',
              ),
              _buildBadge(
                icon: MyCustomIcons
                    .heart, // Using local workaround or generic Icon
                color: const Color(0xFFDC2626), // Red
                label: 'Toplum\nYardımcısı',
                customIcon: Icons.favorite,
              ),
              _buildBadge(
                icon: LucideIcons.lock,
                color: Colors.grey[800]!,
                label: 'Kilidli',
                isLocked: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({
    IconData? icon,
    IconData? customIcon,
    required Color color,
    required String label,
    bool isLocked = false,
  }) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: isLocked
                ? []
                : [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Icon(
            customIcon ?? icon,
            color: isLocked ? Colors.grey[500] : Colors.white,
            size: 32.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isLocked ? Colors.grey[500] : Colors.white,
            fontSize: 12.sp,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

// Temporary workaround if Heart icon missing in Lucide
class MyCustomIcons {
  static const IconData heart = Icons.favorite;
}
