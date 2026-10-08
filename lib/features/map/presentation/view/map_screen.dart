import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/utils/format.dart';
import 'package:teknolup/core/utils/geo.dart';
import 'package:teknolup/core/utils/modules.dart';
import 'package:teknolup/features/home/data/models/nearby_service.dart';
import 'package:teknolup/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

const LatLng _kIstanbul = LatLng(41.0082, 28.9784);

const _darkMap = ColorFilter.matrix(<double>[
  -0.19, -0.64, -0.065, 0, 190,
  -0.19, -0.64, -0.065, 0, 200,
  -0.19, -0.64, -0.065, 0, 195,
  0, 0, 0, 1, 0,
]);

class MapScreen extends ConsumerStatefulWidget {
  final String? filter;
  const MapScreen({super.key, this.filter});
  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final _controller = MapController();
  late String _filter = const {'repair', 'recycle', 'sell'}.contains(widget.filter) ? widget.filter! : 'all';
  NearbyService? _selected;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final dark = context.isDarkMode;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final here = ref.watch(userLocationProvider).valueOrNull;
    final all = ref.watch(servicesByTypeProvider(null)).valueOrNull ?? const <NearbyService>[];
    final services = _filter == 'all' ? all : all.where((s) => s.type == _filter).toList();
    final filters = [('all', l.mapFilterAll, null), ('repair', l.mapFilterRepair, Symbols.build), ('recycle', l.mapFilterRecycle, Symbols.recycling), ('sell', l.mapFilterSell, Symbols.sell)];
    final safeTop = MediaQuery.of(context).padding.top;
    final navPad = MediaQuery.of(context).padding.bottom;

    Color pin(String? type) => switch (type) {
          'repair' => AppColors.repair,
          'sell' => dark ? AppColors.copper300 : AppColors.sell,
          _ => t.accent,
        };

    return Scaffold(
      backgroundColor: t.canvas,
      body: Stack(children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(color: dark ? const Color(0xFF141C1A) : const Color(0xFFF0F0F0)),
            child: FlutterMap(
              mapController: _controller,
              options: MapOptions(initialCenter: _kIstanbul, initialZoom: 13, onTap: (_, __) => setState(() => _selected = null)),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.teknolup.app',
                  tileBuilder: (context, tile, _) => Opacity(opacity: 0.8, child: dark ? ColorFiltered(colorFilter: _darkMap, child: tile) : tile),
                ),
                MarkerLayer(markers: [
                  for (final s in services.where((e) => e.latitude != null && e.longitude != null))
                    Marker(
                      point: LatLng(s.latitude!, s.longitude!),
                      width: 32,
                      height: 40,
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () => setState(() => _selected = s),
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Icon(Symbols.location_on, size: 32, color: pin(s.type), fill: 1, weight: 400),
                          Positioned(top: 7, child: RsIcon(moduleOf(s.type).icon, size: 14, color: AppColors.onBrand)),
                        ]),
                      ),
                    ),
                ]),
              ],
            ),
          ),
        ),
        Positioned(
          top: safeTop + 24,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 32),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: t.raised, borderRadius: Rad.b12, border: Border.all(color: t.line), boxShadow: Shadows.sm),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  for (final f in filters) ...[
                    _FilterPill(label: f.$2, icon: f.$3, active: _filter == f.$1, onTap: () => setState(() { _filter = f.$1; _selected = null; })),
                    const SizedBox(width: 4),
                  ],
                ]),
              ),
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 24 + navPad,
          child: RsPressable(
            onTap: () {
              if (here == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.mapNoPermission)));
                return;
              }
              _controller.move(LatLng(here.latitude, here.longitude), 15);
            },
            child: Container(width: 56, height: 56, decoration: BoxDecoration(color: t.raised, borderRadius: Rad.b12, border: Border.all(color: t.line), boxShadow: Shadows.sm), alignment: Alignment.center, child: RsIcon(Symbols.my_location, color: t.fg)),
          ),
        ),
        if (_selected != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 24 + navPad,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 448, minWidth: 0),
                child: FractionallySizedBox(
                  widthFactor: 0.92,
                  child: RsCard(
                    tone: RsTone.raised,
                    radius: Rad.b8,
                    stripe: switch (_selected!.type) { 'repair' => RsStripe.repair, 'sell' => RsStripe.sell, _ => RsStripe.accent },
                    shadow: Shadows.sm,
                    padding: const EdgeInsets.all(16),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      RsIconBox(moduleOf(_selected!.type).icon, size: 48, color: moduleOf(_selected!.type).color(t)),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(_selected!.name, style: AppType.headingMd.copyWith(color: t.fg)),
                        const SizedBox(height: 4),
                        Text(_selected!.tags.isNotEmpty ? _selected!.tags : _selected!.address, style: AppType.bodyMd.copyWith(color: t.fg2)),
                        const SizedBox(height: 8),
                        Row(children: [
                          Text(l.mapOpen, style: AppType.label.copyWith(color: t.accent)),
                          () {
                            final km = distanceKm(here, _selected!.latitude, _selected!.longitude);
                            return km == null ? const SizedBox.shrink() : Text('  •  ${fmt.number(km, digits: 1)} ${l.commonUnitKm}', style: AppType.caption.copyWith(color: t.fg2));
                          }(),
                        ]),
                      ])),
                      GestureDetector(onTap: () => setState(() => _selected = null), child: Padding(padding: const EdgeInsets.all(8), child: RsIcon(Symbols.close, color: t.fgOutline))),
                    ]),
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool active;
  final VoidCallback onTap;
  const _FilterPill({required this.label, this.icon, required this.active, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsPressable(
      scale: 0.97,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: active ? t.accent : Colors.transparent, borderRadius: Rad.b12),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[RsIcon(icon!, size: 16, color: active ? t.onAccent : t.fg2), const SizedBox(width: 4)],
          Text(label, style: AppType.label.copyWith(color: active ? t.onAccent : t.fg2)),
        ]),
      ),
    );
  }
}
