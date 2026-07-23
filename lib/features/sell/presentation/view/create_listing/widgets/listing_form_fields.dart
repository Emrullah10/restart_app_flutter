import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFormLabel(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildFormTextField(String hint, {int maxLines = 1}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF374151), // Darker gray specific for input
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16.w),
      ),
    ),
  );
}

Widget buildFormDropdown(
  List<String> items,
  String value,
  ValueChanged<String?> onChanged,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: const Color(0xFF374151),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        dropdownColor: const Color(0xFF374151),
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
