import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

Widget buildFormLabel(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(
      text,
      style: TextStyle(
        color: context.isDarkMode
            ? AppColors.textPrimaryDark
            : AppColors.textPrimaryLight,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildFormTextField(
  BuildContext context,
  String hint, {
  int maxLines = 1,
  TextEditingController? controller,
  TextInputType? keyboardType,
}) {
  return Container(
    decoration: BoxDecoration(
      color: context.isDarkMode
          ? AppColors.surfaceDark
          : AppColors.surfaceAltLight,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        color: context.isDarkMode
            ? AppColors.textPrimaryDark
            : AppColors.textPrimaryLight,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: context.isDarkMode
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          fontSize: 14.sp,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16.w),
      ),
    ),
  );
}

Widget buildFormDropdown(
  BuildContext context,
  List<String> items,
  String value,
  ValueChanged<String?> onChanged,
) {
  final Color surface = context.isDarkMode
      ? AppColors.surfaceDark
      : AppColors.surfaceAltLight;
  final Color textColor = context.isDarkMode
      ? AppColors.textPrimaryDark
      : AppColors.textPrimaryLight;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: surface,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        dropdownColor: surface,
        style: TextStyle(color: textColor, fontSize: 14.sp),
        icon: Icon(Icons.keyboard_arrow_down, color: textColor),
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
