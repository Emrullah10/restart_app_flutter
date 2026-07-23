import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/recycle/presentation/widgets/recycle_header.dart'; // Reusing generic header

class RecycleMapScreen extends StatelessWidget {
  const RecycleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SafeArea(
        child: Stack(
          children: [
            // Map Placeholder
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF1F2937),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.mapPin, color: Colors.white, size: 48.sp),
                    SizedBox(height: 16.h),
                    Text(
                      'Harita yükleniyor...',
                      style: TextStyle(
                        color: Colors.white,
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
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildLocationCard(
                    icon: LucideIcons.recycle,
                    title: 'Teknosa Mağazası',
                    distance: '850m uzaklıkta • Açık',
                    iconColor: const Color(0xFF10B981),
                  ),
                  SizedBox(height: 12.h),
                  _buildLocationCard(
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

  Widget _buildLocationCard({
    required IconData icon,
    required String title,
    required String distance,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937), // Solid dark bg for visibility over map
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
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
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  distance,
                  style: TextStyle(
                    color: Colors.grey[400],
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
