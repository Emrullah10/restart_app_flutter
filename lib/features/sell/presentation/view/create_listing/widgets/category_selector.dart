import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const List<IconData> _icons = [
    LucideIcons.cpu,
    LucideIcons.smartphone,
    LucideIcons.plug,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.selectCategory,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: List.generate(
              categories.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: _buildChip(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1F2937)
              : const Color(0xFF1F2937).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
            width: isSelected ? 1 : 0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              _icons[index],
              color: isSelected ? const Color(0xFF3B82F6) : Colors.grey[400],
              size: 16.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? const Color(0xFF3B82F6) : Colors.grey[400],
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
