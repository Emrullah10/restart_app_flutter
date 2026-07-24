import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class PhotoUploadSection extends StatelessWidget {
  const PhotoUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.addPhoto,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPhotoBox(context, isCamera: true),
              _buildPhotoBox(context),
              _buildPhotoBox(context),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.photoLimitNote,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoBox(BuildContext context, {bool isCamera = false}) {
    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.surfaceDark
            : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.theme.dividerColor),
      ),
      child: Icon(
        isCamera ? LucideIcons.camera : LucideIcons.plus,
        color: context.isDarkMode
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
        size: 24.sp,
      ),
    );
  }
}
