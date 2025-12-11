import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/constants/app_colors.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class DeviceCategoryGrid extends StatelessWidget {
  const DeviceCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': LucideIcons.smartphone, 'label': context.l10n.catPhone},
      {'icon': LucideIcons.laptop, 'label': context.l10n.catComputer},
      {'icon': LucideIcons.headphones, 'label': context.l10n.catHeadphones},
      {'icon': LucideIcons.tablet, 'label': context.l10n.catTablet},
      {'icon': LucideIcons.gamepad2, 'label': context.l10n.catConsole},
      {'icon': LucideIcons.tv, 'label': context.l10n.catTV},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            context.l10n.deviceTypeSelectSub,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                children: [
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: context.theme.dividerColor.withOpacity(0.1),
                      ),
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      color: AppColors.primary,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    category['label'] as String,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
