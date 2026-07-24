import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/recycle/presentation/widgets/recycle_header.dart'; // Reusing generic header
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleMapScreen extends StatelessWidget {
  const RecycleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            // Map Placeholder
            Container(
              width: double.infinity,
              height: double.infinity,
              color: context.isDarkMode
                  ? AppColors.surfaceDark
                  : AppColors.surfaceLight,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LucideIcons.mapPin,
                      color: context.isDarkMode
                          ? AppColors.iconDark
                          : AppColors.iconLight,
                      size: 48.sp,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Harita yükleniyor...',
                      style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Back Button and Header Overlay
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: RecycleHeader(),
            ),

            // Bottom Sheets / Cards
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: 24.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'En Yakın Noktalar',
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildLocationCard(
                    context,
                    icon: LucideIcons.recycle,
                    title: 'Teknosa Mağazası',
                    distance: '850m uzaklıkta • Açık',
                    iconColor: const Color(0xFF10B981),
                  ),
                  SizedBox(height: 12.h),
                  _buildLocationCard(
                    context,
                    icon: LucideIcons.store,
                    title: 'Vatan Bilgisayar',
                    distance: '1.2km uzaklıkta • Açık',
                    iconColor: const Color(0xFF3B82F6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String distance,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.surfaceDark
            : AppColors.surfaceLight, // Solid bg for visibility over map
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  distance,
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
            'Yol Tarifi',
            style: TextStyle(
              color: const Color(0xFF2DD4BF), // Teal
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
