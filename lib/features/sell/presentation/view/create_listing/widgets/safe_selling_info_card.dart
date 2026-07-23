import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SafeSellingInfoCard extends StatelessWidget {
  const SafeSellingInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  LucideIcons.shieldCheck,
                  color: const Color(0xFF3B82F6),
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Güvenli Satış',
                  style: TextStyle(
                    color: const Color(0xFF3B82F6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Üniversiteler ve sertifikalı tamircilerle eşleştirme yapıyoruz. Güvenli ödeme ve teslimat garantisi.',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.sp,
                height: 1.4,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Detayları Gör',
              style: TextStyle(
                color: const Color(0xFF3B82F6),
                fontSize: 12.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
