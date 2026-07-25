import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/home/data/models/nearby_service.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:mobile_flutter/features/map/presentation/widgets/map_filter_bar.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

const LatLng _kIstanbulCenter = LatLng(41.0082, 28.9784);

class MapScreen extends ConsumerStatefulWidget {
  final String? filter;
  const MapScreen({super.key, this.filter});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  // 0: All, 1: Repair, 2: Sell, 3: Recycle
  late int _selectedFilterIndex;
  bool _isSearching = false;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _selectedFilterIndex = _getFilterIndexFromParam(widget.filter);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int _getFilterIndexFromParam(String? filter) {
    if (filter == 'repair') return 1;
    if (filter == 'sell') return 2;
    if (filter == 'recycle') return 3;
    return 0;
  }

  String? _typeForFilterIndex(int index) {
    switch (index) {
      case 1:
        return 'repair';
      case 2:
        return 'sell';
      case 3:
        return 'recycle';
      default:
        return null;
    }
  }

  IconData _iconForType(String? type) {
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

  Color _colorForType(String? type) {
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

  List<NearbyService> _filterServices(List<NearbyService> services) {
    final type = _typeForFilterIndex(_selectedFilterIndex);
    final query = _query.trim().toLowerCase();
    return services.where((s) {
      final matchesType = type == null || s.type == type;
      final matchesQuery =
          query.isEmpty || s.name.toLowerCase().contains(query);
      return matchesType && matchesQuery;
    }).toList();
  }

  List<Marker> _buildMarkers(List<NearbyService> services) => services
      .where((s) => s.latitude != null && s.longitude != null)
      .map(
        (s) => Marker(
          point: LatLng(s.latitude!, s.longitude!),
          width: 40.w,
          height: 40.w,
          child: Container(
            decoration: BoxDecoration(
              color: _colorForType(s.type),
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
            child: Icon(_iconForType(s.type), color: Colors.white, size: 20.sp),
          ),
        ),
      )
      .toList();

  void _recenterOnIstanbul() {
    _mapController.move(_kIstanbulCenter, 13.0);
  }

  void _showPointsList(List<NearbyService> services) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: services.isEmpty
              ? Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Text(context.l10n.noResults),
                )
              : ListView(
                  shrinkWrap: true,
                  children: services
                      .map(
                        (s) => ListTile(
                          leading: Icon(
                            _iconForType(s.type),
                            color: _colorForType(s.type),
                          ),
                          title: Text(s.name),
                          subtitle: Text(s.address),
                          onTap: () {
                            Navigator.pop(context);
                            if (s.latitude != null && s.longitude != null) {
                              _mapController.move(
                                LatLng(s.latitude!, s.longitude!),
                                15.0,
                              );
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final servicesAsync = ref.watch(servicesByTypeProvider(null));
    final services = _filterServices(servicesAsync.valueOrNull ?? const []);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // 1. Map Layer
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: _kIstanbulCenter,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.mobile_flutter',
                // Always use standard OSM tiles (not affected by dark mode)
              ),
              MarkerLayer(markers: _buildMarkers(services)),
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
                        child: _isSearching
                            ? TextField(
                                controller: _searchController,
                                autofocus: true,
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: context.l10n.searchHint,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) =>
                                    setState(() => _query = value),
                              )
                            : Text(
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
                          _isSearching ? LucideIcons.x : LucideIcons.search,
                          color: context.theme.iconTheme.color,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isSearching) {
                              _searchController.clear();
                              _query = '';
                            }
                            _isSearching = !_isSearching;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  MapFilterBar(
                    initialIndex: _selectedFilterIndex,
                    onFilterChanged: (index) =>
                        setState(() => _selectedFilterIndex = index),
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
              onTap: () => _showPointsList(services),
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
              onPressed: _recenterOnIstanbul,
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
