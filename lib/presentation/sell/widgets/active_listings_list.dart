import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/sell/riverpod/marketplace_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class ActiveListingsList extends ConsumerWidget {
  const ActiveListingsList({super.key});

  IconData _getIconForCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'screen':
      case 'ekran':
        return LucideIcons.cpu;
      case 'battery':
      case 'batarya':
        return LucideIcons.battery;
      case 'cable':
      case 'kablo':
        return LucideIcons.plug;
      case 'phone':
      case 'telefon':
        return LucideIcons.smartphone;
      default:
        return LucideIcons.package;
    }
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
      case 'aktif':
        return const Color(0xFF10B981);
      case 'pending':
      case 'beklemede':
        return const Color(0xFFF59E0B);
      case 'sold':
      case 'satıldı':
        return Colors.grey[600]!;
      default:
        return const Color(0xFF10B981);
    }
  }

  String _getStatusText(String? status, BuildContext context) {
    switch (status?.toLowerCase()) {
      case 'active':
        return context.l10n.statusActive;
      case 'pending':
        return context.l10n.statusPending;
      case 'sold':
        return context.l10n.statusSold;
      default:
        return status ?? '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsState = ref.watch(listingsProvider);
    final listings = listingsState.listings;

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
          if (listingsState.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF22C55E)),
            )
          else if (listingsState.error != null)
            Text(
              'Hata: ${listingsState.error}',
              style: TextStyle(color: Colors.red[400], fontSize: 12.sp),
            )
          else if (listings.isEmpty)
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Henüz ilan yok',
                style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
              ),
            )
          else
            ...listings.take(3).map((listing) {
              final category = listing.category;
              final title = listing.title;
              final description = listing.description;
              final price = listing.price;
              final status = listing.status;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _buildListingItem(
                  icon: _getIconForCategory(category),
                  title: title,
                  subtitle: description,
                  price: '₺${price.toString()}',
                  status: _getStatusText(status, context),
                  statusColor: _getStatusColor(status),
                ),
              );
            }),
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
