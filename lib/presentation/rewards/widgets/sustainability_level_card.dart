import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/profile/riverpod/profile_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class SustainabilityLevelCard extends ConsumerWidget {
  const SustainabilityLevelCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profile = profileState.profile;

    final points = profile?.totalPoints ?? 0;
    final level = profile?.level ?? 1;

    // Logic for next level (Simplified for now)
    final pointsToNext = level * 1000;
    final progress = points / pointsToNext;
    final remaining = pointsToNext - points > 0 ? pointsToNext - points : 0;

    String levelName = context.l10n.levelBronze;
    Color levelColor = const Color(0xFFCD7F32); // Bronze
    if (level == 2) {
      levelName = context.l10n.levelSilver;
      levelColor = Colors.grey[400]!;
    } else if (level >= 3) {
      levelName = context.l10n.levelGold;
      levelColor = const Color(0xFFEAB308);
    }

    return Column(
      children: [
        Icon(LucideIcons.sprout, color: Colors.white, size: 48.sp),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: levelColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: levelColor.withOpacity(0.5)),
          ),
          child: Text(
            levelName,
            style: TextStyle(
              color: levelColor,
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
                    '${points.toString()} / ${pointsToNext.toString()}',
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
                  value: progress > 1.0 ? 1.0 : progress,
                  backgroundColor: const Color(0xFF374151),
                  valueColor: AlwaysStoppedAnimation<Color>(levelColor),
                  minHeight: 8.h,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                context.l10n.pointsToNextLevel(remaining),
                style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
