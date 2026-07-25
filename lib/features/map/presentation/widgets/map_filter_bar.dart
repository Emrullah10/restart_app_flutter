import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class MapFilterBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int>? onFilterChanged;
  const MapFilterBar({super.key, this.initialIndex = 0, this.onFilterChanged});

  @override
  State<MapFilterBar> createState() => _MapFilterBarState();
}

class _MapFilterBarState extends State<MapFilterBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _buildFilterChip(
            context,
            0,
            context.l10n.mapFilterAll,
            LucideIcons.mapPin,
            const Color(0xFF10B981),
          ),
          SizedBox(width: 8.w),
          _buildFilterChip(
            context,
            1,
            context.l10n.mapFilterRepair,
            LucideIcons.wrench,
            const Color(0xFF3B82F6),
          ),
          SizedBox(width: 8.w),
          _buildFilterChip(
            context,
            2,
            context.l10n.mapFilterSell,
            LucideIcons.store,
            const Color(0xFFF97316),
          ), // Store/Shop icon
          SizedBox(width: 8.w),
          _buildFilterChip(
            context,
            3,
            '',
            LucideIcons.recycle,
            const Color(0xFF22C55E),
            isIconOnly: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    int index,
    String label,
    IconData icon,
    Color color, {
    bool isIconOnly = false,
  }) {
    final bool isSelected = _selectedIndex == index;
    final Color inactiveTextColor = context.isDarkMode
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        widget.onFilterChanged?.call(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? color
              : (context.isDarkMode
                    ? AppColors.surfaceDark
                    : AppColors.surfaceLight),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? color
                : context.theme.dividerColor.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : inactiveTextColor,
              size: 16.sp,
            ),
            if (!isIconOnly) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : inactiveTextColor,
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
