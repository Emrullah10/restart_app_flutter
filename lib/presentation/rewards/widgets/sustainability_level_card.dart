import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class SustainabilityLevelCard extends StatelessWidget {
  const SustainabilityLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(LucideIcons.sprout, color: Colors.white, size: 48.sp),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFEAB308).withOpacity(0.2), // Yellow/Gold
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xFFEAB308).withOpacity(0.5)),
          ),
          child: Text(
            context.l10n.levelSilver,
            style: TextStyle(
              color: const Color(0xFFEAB308),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          context.l10n.sustainabilityLevelTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.sustainabilityLevelSubtitle,
          style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.levelBronze,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                  Text(
                    '1,250 / 2,000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    context.l10n.levelGold,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: 1250 / 2000,
                  backgroundColor: const Color(0xFF374151),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFEAB308),
                  ),
                  minHeight: 8.h,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                context.l10n.pointsToNextLevel(750),
                style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
