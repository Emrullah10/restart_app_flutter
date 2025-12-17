import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class ActiveListingsList extends StatelessWidget {
  const ActiveListingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.activeListingsTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.viewAll,
                style: TextStyle(
                  color: const Color(0xFF3B82F6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildListingItem(
            icon: LucideIcons.cpu,
            title: 'iPhone 12 Ekran',
            subtitle: 'Orijinal, çalışır durumda',
            price: '₺850',
            status: context.l10n.statusActive,
            statusColor: const Color(0xFF10B981), // Green
          ),
          SizedBox(height: 16.h),
          _buildListingItem(
            icon: LucideIcons.battery,
            title: 'Samsung Batarya',
            subtitle: 'Galaxy S21, %85 sağlık',
            price: '₺320',
            status: context.l10n.statusPending,
            statusColor: const Color(0xFFF59E0B), // Amber
          ),
          SizedBox(height: 16.h),
          _buildListingItem(
            icon: LucideIcons.plug, // Using plug icon for cable
            title: 'Lightning Kablo Seti',
            subtitle: 'Orijinal Apple, 3 adet',
            price: '₺180',
            status: context.l10n.statusSold,
            statusColor: Colors.grey[600]!, // Gray
          ),
        ],
      ),
    );
  }

  Widget _buildListingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: const Color(0xFF3B82F6), size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Icon(
                LucideIcons.moreHorizontal,
                color: Colors.grey[400],
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
