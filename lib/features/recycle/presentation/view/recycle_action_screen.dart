import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_cargo_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_map_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/widgets/recycle_header.dart'; // Reusing header if appropriate or creating custom one
// Actually the second screen has the same "Dönüştür" header.

class RecycleActionScreen extends StatelessWidget {
  const RecycleActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SafeArea(
        child: Column(
          children: [
            const RecycleHeader(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF7F1D1D,
                        ).withOpacity(0.2), // Red background
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LucideIcons.smartphone,
                        color: const Color(0xFFEF4444), // Red
                        size: 48.sp,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Bu cihaz artık çalışmıyor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Geri dönüşüm için en uygun seçeneği\nbelirleyelim',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 48.h),

                    _buildOptionButton(
                      icon: LucideIcons.mapPin,
                      title: 'Yakındaki Geri Dönüşüm\nNoktaları',
                      color: const Color(0xFF10B981), // Green
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecycleMapScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildOptionButton(
                      icon: LucideIcons.truck,
                      title: 'Kargo ile Gönder',
                      color: const Color(0xFF0F50C1), // Blue
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecycleCargoScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24.sp),
            SizedBox(width: 12.w),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
