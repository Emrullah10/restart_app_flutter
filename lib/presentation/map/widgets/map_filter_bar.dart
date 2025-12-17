import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class MapFilterBar extends StatefulWidget {
  final int initialIndex;
  const MapFilterBar({super.key, this.initialIndex = 0});

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
            0,
            context.l10n.mapFilterAll,
            LucideIcons.mapPin,
            const Color(0xFF10B981),
          ),
          SizedBox(width: 8.w),
          _buildFilterChip(
            1,
            context.l10n.mapFilterRepair,
            LucideIcons.wrench,
            const Color(0xFF3B82F6),
          ),
          SizedBox(width: 8.w),
          _buildFilterChip(
            2,
            context.l10n.mapFilterSell,
            LucideIcons.store,
            const Color(0xFFF97316),
          ), // Store/Shop icon
          SizedBox(width: 8.w),
          _buildFilterChip(
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
    int index,
    String label,
    IconData icon,
    Color color, {
    bool isIconOnly = false,
  }) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? color : const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? color : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[400],
              size: 16.sp,
            ),
            if (!isIconOnly) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[400],
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
