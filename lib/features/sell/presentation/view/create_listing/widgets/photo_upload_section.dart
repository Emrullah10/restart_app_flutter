import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
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
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPhotoBox(isCamera: true),
              _buildPhotoBox(),
              _buildPhotoBox(),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.photoLimitNote,
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoBox({bool isCamera = false}) {
    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Icon(
        isCamera ? LucideIcons.camera : LucideIcons.plus,
        color: Colors.grey[400],
        size: 24.sp,
      ),
    );
  }
}
