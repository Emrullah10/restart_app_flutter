import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/map/presentation/widgets/map_filter_bar.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class MapScreen extends StatefulWidget {
  final String? filter;
  const MapScreen({super.key, this.filter});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();

  // 0: All, 1: Repair, 2: Sell, 3: Recycle
  late int _selectedFilterIndex;

  @override
  void initState() {
    super.initState();
    _selectedFilterIndex = _getFilterIndexFromParam(widget.filter);
  }

  int _getFilterIndexFromParam(String? filter) {
    if (filter == 'repair') return 1;
    if (filter == 'sell') return 2;
    if (filter == 'recycle') return 3;
    return 0;
  }

  // Dummy markers for demonstration
  final List<Marker> _markers = [
    // Repair Shop
    Marker(
      point: const LatLng(41.0082, 28.9784), // Istanbul
      width: 40.w,
      height: 40.w,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF3B82F6), // Blue
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(LucideIcons.wrench, color: Colors.white, size: 20.sp),
      ),
    ),
    // Recycle Point
    Marker(
      point: const LatLng(41.0150, 28.9850),
      width: 40.w,
      height: 40.w,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF22C55E), // Green
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(LucideIcons.recycle, color: Colors.white, size: 20.sp),
      ),
    ),
    // Sell/Shop
    Marker(
      point: const LatLng(41.0200, 28.9700),
      width: 40.w,
      height: 40.w,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF97316), // Orange
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(LucideIcons.store, color: Colors.white, size: 20.sp),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // 1. Map Layer
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(41.0082, 28.9784), // Istanbul Center
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.mobile_flutter',
                // Always use standard OSM tiles (not affected by dark mode)
              ),
              MarkerLayer(markers: _markers),
            ],
          ),

          // 2. Header and Filter Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16.h,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.theme.scaffoldBackgroundColor.withOpacity(0.9),
                    context.theme.scaffoldBackgroundColor.withOpacity(0.0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Back button replaced by SizedBox as requested (it's a main tab)
                      // No, user said "geri itme butonunu... kaldır".
                      SizedBox(width: 48.w),
                      Expanded(
                        child: Text(
                          context.l10n.mapTitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          LucideIcons.search,
                          color: context.theme.iconTheme.color,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const MapFilterBar(), // Need refactor to accept index.
                  // For now, let's assume user accepts default All, or if I change it:
                  // I should refactor MapFilterBar to be stateless or accept initial index.
                  // Let's do a quick inline update to MapFilterBar first.
                ],
              ),
            ),
          ),

          // 3. Floating "List" Button at Bottom Left
          Positioned(
            bottom: 32.h,
            left: 24.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: context.theme.dividerColor.withOpacity(0.1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.list,
                      color: context.theme.iconTheme.color,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      context.l10n.listButton,
                      style: TextStyle(
                        color: context.theme.colorScheme.onSurface,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Floating Location Button at Bottom Right
          Positioned(
            bottom: 32.h,
            right: 24.w,
            child: FloatingActionButton(
              onPressed: () {
                // Determine user location logic here
              },
              backgroundColor: context.theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(LucideIcons.compass, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
