import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/data/models/service_model.dart';
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

  String _getTypeLabel(String? type) {
    switch (type) {
      case 'repair':
        return 'Tamir';
      case 'recycle':
        return 'Geri Dönüşüm';
      case 'sell':
        return 'Satış';
      default:
        return 'Servis';
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
        // Tip Filtreleri
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              _buildFilterChip(
                label: 'Tümü',
                isSelected: servicesState.selectedType == null,
                onTap: () =>
                    ref.read(servicesProvider.notifier).filterByType(null),
              ),
              SizedBox(width: 8.w),
              _buildFilterChip(
                label: 'Geri Dönüşüm',
                isSelected: servicesState.selectedType == 'recycle',
                onTap: () =>
                    ref.read(servicesProvider.notifier).filterByType('recycle'),
                color: const Color(0xFF22C55E),
              ),
              SizedBox(width: 8.w),
              _buildFilterChip(
                label: 'Tamir',
                isSelected: servicesState.selectedType == 'repair',
                onTap: () =>
                    ref.read(servicesProvider.notifier).filterByType('repair'),
                color: const Color(0xFF3B82F6),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
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
          ...services
              .take(5)
              .map(
                (service) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildServiceItem(context: context, service: service),
                ),
              ),
      ],
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color color = const Color(0xFF6B7280),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? color : Colors.grey[600]!,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? color : Colors.grey[400],
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem({
    required BuildContext context,
    required ServiceModel service,
  }) {
    final type = service.type;
    final color = _getColorForType(type);
    final icon = _getIconForType(type);
    final distance = service.formattedDistance;

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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        service.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Mesafe rozeti
                    if (distance.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF22C55E).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.mapPin,
                              color: const Color(0xFF22C55E),
                              size: 12.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              distance,
                              style: TextStyle(
                                color: const Color(0xFF22C55E),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        service.address,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.star, color: Colors.amber, size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      service.rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                if (service.tags.isNotEmpty)
                  Wrap(
                    spacing: 6.w,
                    runSpacing: 4.h,
                    children: service.tags
                        .take(3)
                        .map(
                          (tag) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(color: color, fontSize: 10.sp),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
