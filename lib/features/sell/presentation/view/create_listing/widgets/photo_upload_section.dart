import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

const int kMaxListingPhotos = 5;

class PhotoUploadSection extends StatefulWidget {
  const PhotoUploadSection({super.key, required this.onImagesChanged});

  final ValueChanged<List<XFile>> onImagesChanged;

  @override
  State<PhotoUploadSection> createState() => _PhotoUploadSectionState();
}

class _PhotoUploadSectionState extends State<PhotoUploadSection> {
  final List<XFile> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final remaining = kMaxListingPhotos - _images.length;
    if (remaining <= 0) return;
    final picked = await _picker.pickMultiImage(limit: remaining);
    if (picked.isEmpty) return;
    setState(() => _images.addAll(picked));
    widget.onImagesChanged(_images);
  }

  void _removeAt(int index) {
    setState(() => _images.removeAt(index));
    widget.onImagesChanged(_images);
  }

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
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              for (int i = 0; i < _images.length; i++)
                _buildPhotoPreview(context, _images[i], i),
              if (_images.length < kMaxListingPhotos)
                _buildAddPhotoBox(context, isCamera: _images.isEmpty),
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

  Widget _buildPhotoPreview(BuildContext context, XFile file, int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.file(
            File(file.path),
            width: 100.w,
            height: 100.w,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _removeAt(index),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                LucideIcons.x,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoBox(BuildContext context, {bool isCamera = false}) {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
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
      ),
    );
  }
}
