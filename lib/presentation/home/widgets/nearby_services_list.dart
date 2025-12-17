import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/home/riverpod/services_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class NearbyServicesList extends ConsumerWidget {
  const NearbyServicesList({super.key});

  IconData _getIconForType(String? type) {
    switch (type) {
      case 'repair':
        return LucideIcons.wrench;
      case 'recycle':
        return LucideIcons.recycle;
      case 'sell':
        return LucideIcons.store;
      default:
        return LucideIcons.mapPin;
    }
  }

  Color _getColorForType(String? type) {
    switch (type) {
      case 'repair':
        return const Color(0xFF3B82F6);
      case 'recycle':
        return const Color(0xFF22C55E);
      case 'sell':
        return const Color(0xFFF97316);
      default:
        return const Color(0xFF6B7280);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesState = ref.watch(servicesProvider);
    final services = servicesState.services;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.nearbyServicesTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to map screen
                  GoRouter.of(context).go('/map');
                },
                child: Text(
                  context.l10n.viewOnMapButton,
                  style: TextStyle(
                    color: const Color(0xFF22C55E),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        if (servicesState.isLoading)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: const CircularProgressIndicator(color: Color(0xFF22C55E)),
          )
        else if (servicesState.error != null)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Text(
              'Hata: ${servicesState.error}',
              style: TextStyle(color: Colors.red[400], fontSize: 12.sp),
            ),
          )
        else if (services.isEmpty)
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Text(
              'Yakında servis bulunamadı',
              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            ),
          )
        else
          ...services.take(3).map((service) {
            final type = service['type'] as String?;
            final name = service['name'] ?? '';
            final rating = (service['rating'] ?? 0.0);
            final ratingDouble = rating is double
                ? rating
                : double.tryParse(rating.toString()) ?? 0.0;
            final tags = service['tags'] ?? '';
            final address = service['address'] ?? '';

            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildServiceItem(
                icon: _getIconForType(type),
                title: name,
                distance: address,
                rating: ratingDouble,
                tags: tags,
                actionText: type == 'repair'
                    ? context.l10n.actionContact
                    : context.l10n.actionGetDirections,
                color: _getColorForType(type),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required String distance,
    required double rating,
    required String tags,
    required String actionText,
    required Color color,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
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
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      distance,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.star, color: Colors.amber, size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  tags,
                  style: TextStyle(
                    color: const Color(0xFF22C55E),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              backgroundColor: Colors.transparent,
            ),
            child: Text(
              actionText,
              style: TextStyle(
                color: const Color(0xFF22C55E),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
