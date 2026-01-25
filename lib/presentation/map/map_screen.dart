import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/data/models/models.dart';
import 'package:mobile_flutter/presentation/home/riverpod/services_provider.dart';
import 'package:mobile_flutter/presentation/map/widgets/map_filter_bar.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class MapScreen extends ConsumerStatefulWidget {
  final String? filter;
  const MapScreen({super.key, this.filter});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  // 0: All, 1: Repair, 2: Sell, 3: Recycle
  late int _selectedFilterIndex;

  @override
  void initState() {
    super.initState();
    _selectedFilterIndex = _getFilterIndexFromParam(widget.filter);
    // Load initial services
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadServicesByFilter(_selectedFilterIndex);
    });
  }

  void _loadServicesByFilter(int index) {
    String? type;
    if (index == 1) type = 'repair';
    if (index == 2) type = 'sell';
    if (index == 3) type = 'recycle';
    ref.read(servicesProvider.notifier).loadNearbyServices(type: type);
  }

  int _getFilterIndexFromParam(String? filter) {
    if (filter == 'repair') return 1;
    if (filter == 'sell') return 2;
    if (filter == 'recycle') return 3;
    return 0;
  }

  List<Marker> _buildMarkers(List<ServiceModel> services) {
    return services.map((service) {
      final color = _getColorForType(service.type);
      final icon = _getIconForType(service.type);

      return Marker(
        point: LatLng(service.latitude, service.longitude),
        width: 40.w,
        height: 40.w,
        child: GestureDetector(
          onTap: () => _showServiceInfo(service),
          child: Container(
            decoration: BoxDecoration(
              color: color,
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
            child: Icon(icon, color: Colors.white, size: 20.sp),
          ),
        ),
      );
    }).toList();
  }

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
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

  Color _getColorForType(String type) {
    switch (type.toLowerCase()) {
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

  void _showServiceInfo(ServiceModel service) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => Container(
        margin: EdgeInsets.all(24.w),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getColorForType(service.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    service.type.toUpperCase(),
                    style: TextStyle(
                      color: _getColorForType(service.type),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  service.rating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              service.address,
              style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF22C55E),
                minimumSize: Size(double.infinity, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                context.l10n.actionGetDirections,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final servicesState = ref.watch(servicesProvider);
    final markers = _buildMarkers(servicesState.services);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // 1. Map Layer
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(41.0082, 28.9784), // Istanbul Center
              initialZoom: 13.0,
              onTap: (_, __) {
                // Close any open info panels if needed
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.mobile_flutter',
              ),
              MarkerLayer(markers: markers),
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
                  MapFilterBar(
                    initialIndex: _selectedFilterIndex,
                    onFilterChanged: (index) {
                      setState(() => _selectedFilterIndex = index);
                      _loadServicesByFilter(index);
                    },
                  ),
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
                // Center map on user location
                _mapController.move(const LatLng(41.0082, 28.9784), 14.0);
              },
              backgroundColor: context.theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                LucideIcons.compass,
                color: context.theme.primaryColor,
              ),
            ),
          ),

          // 5. Loading Indicator Overlay
          if (servicesState.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF22C55E)),
            ),
        ],
      ),
    );
  }
}
