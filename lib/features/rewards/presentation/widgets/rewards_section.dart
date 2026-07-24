import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RewardsSection extends StatelessWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.rewardsTitle,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.l10n.brandCollaborations,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildRewardItem(
          context,
          icon: LucideIcons.gift, // Placeholder for MediaMarkt logo
          iconColor: Colors.white,
          bgColor: const Color(0xFF7F1D1D), // Red for MediaMarkt
          title: 'MediaMarkt',
          subtitle: '50₺ Hediye Çeki',
          points: '500 puan',
          buttonText: context.l10n.useButton,
          buttonColor: const Color(0xFF3B82F6),
        ),
        SizedBox(height: 12.h),
        _buildRewardItem(
          context,
          icon: LucideIcons.shoppingBag, // Placeholder for Migros
          iconColor: Colors.white,
          bgColor: const Color(0xFF1F2937),
          title: 'Migros',
          subtitle: '100₺ Hediye Çeki',
          points: '800 puan',
          buttonText: context.l10n.useButton,
          buttonColor: const Color(0xFF3B82F6),
        ),
        SizedBox(height: 12.h),
        _buildRewardItem(
          context,
          icon: LucideIcons.coffee, // Placeholder for Starbucks
          iconColor: Colors.white,
          bgColor: const Color(0xFF065F46), // Green for Starbucks
          title: 'Starbucks',
          subtitle: '75₺ Hediye Çeki',
          points: '1,500 puan',
          buttonText: context.l10n.insufficientPoints,
          buttonColor: Colors.transparent,
          textColor: context.isDarkMode
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
      ],
    );
  }

  Widget _buildRewardItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String subtitle,
    required String points,
    required String buttonText,
    required Color buttonColor,
    Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: bgColor,
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
                Text(
                  subtitle,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: TextStyle(
                  color: const Color(0xFFF97316),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              if (buttonColor != Colors.transparent)
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 12.sp),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
