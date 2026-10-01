import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/core/utils/format.dart';
import 'package:mobile_flutter/core/utils/geo.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/couriers_provider.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_state.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleCargoScreen extends ConsumerWidget {
  const RecycleCargoScreen({super.key});

  Future<void> _choose(BuildContext context, WidgetRef ref, TransportMode mode) async {
    final l = context.l10n;
    final vm = ref.read(recycleViewModelProvider.notifier);
    vm.setTransportMode(mode);
    final userId = ref.read(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return;
    final s = ref.read(recycleViewModelProvider);
    final ok = await vm.submitRecycle(userId, s.selectedCenterId, s.wasteType, s.weightKg == 0 ? 1 : s.weightKg);
    if (!context.mounted) return;
    if (ok) {
      context.go(Routes.recycleSuccess);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.recFailed)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final here = ref.watch(userLocationProvider).valueOrNull;
    final couriers = ref.watch(couriersProvider).valueOrNull ?? const <CourierOption>[];
    final loading = ref.watch(recycleViewModelProvider).isLoading;
    final center = LatLng(here?.latitude ?? 41.0082, here?.longitude ?? 28.9784);
    final electric = couriers.where((c) => c.electric).toList();
    final standard = couriers.where((c) => !c.electric).toList();

    String meta(double? km) => km == null ? '' : '${fmt.number(km, digits: 1)} ${l.commonUnitKm} • ${l.courierEta((km * 5).round().toString())}';

    Widget card({required Widget avatar, required String title, Widget? badge, required String meta, required RsStripe stripe, required bool primary, String? note, bool tag = false}) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RsCard(
            tone: primary ? RsTone.accentSubtle : RsTone.raised,
            stripe: stripe,
            borderColor: primary ? t.accentContainerDim : t.line,
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(children: [
                  avatar,
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [Flexible(child: Text(title, style: AppType.headingMd.copyWith(color: t.fg), overflow: TextOverflow.ellipsis)), if (badge != null) ...[const SizedBox(width: 8), badge]]),
                    const SizedBox(height: 4),
                    Text(meta, style: AppType.caption.copyWith(color: t.fg2)),
                  ])),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, left: 8),
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(border: Border(top: BorderSide(color: primary ? t.accentContainerDim.withValues(alpha: 0.5) : t.line))),
                child: Row(mainAxisAlignment: note != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end, children: [
                  if (note != null) Text(note, style: AppType.label.copyWith(color: t.accent)),
                  RsButton(l.courierSelect, full: false, loading: loading, radius: Rad.b4, variant: primary ? RsButtonVariant.primary : RsButtonVariant.secondary, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), onPressed: () => _choose(context, ref, primary ? TransportMode.electric : TransportMode.standard)),
                ]),
              ),
            ]),
          ),
        );

    Widget person(bool accent) => Container(width: 48, height: 48, decoration: BoxDecoration(color: accent ? t.surface : t.muted, borderRadius: Rad.b12, border: Border.all(color: t.line)), alignment: Alignment.center, child: RsIcon(Symbols.person, color: accent ? t.accent : t.fg2));

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: const RsBrandBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: ListView(padding: const EdgeInsets.fromLTRB(24, 32, 24, 24), children: [
            Row(children: [
              for (var i = 0; i < 4; i++) ...[if (i > 0) const SizedBox(width: 0), Expanded(child: Container(height: 4, decoration: BoxDecoration(color: t.accentStrong, borderRadius: BorderRadius.horizontal(left: i == 0 ? Rad.r12 : Radius.zero, right: i == 3 ? Rad.r12 : Radius.zero))))],
            ]),
            const SizedBox(height: 16),
            Text(l.courierTitle, style: AppType.headingLg.copyWith(color: t.fg)),
            const SizedBox(height: 4),
            Text(l.courierSub, style: AppType.caption.copyWith(color: t.fg2)),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: Rad.b4,
              child: Container(
                height: 192,
                decoration: BoxDecoration(border: Border.all(color: t.line), borderRadius: Rad.b4),
                child: IgnorePointer(
                  child: FlutterMap(
                    options: MapOptions(initialCenter: center, initialZoom: 14),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.example.mobile_flutter', tileBuilder: (c, tile, _) => context.isDarkMode ? ColorFiltered(colorFilter: const ColorFilter.matrix(<double>[-0.19, -0.64, -0.065, 0, 190, -0.19, -0.64, -0.065, 0, 200, -0.19, -0.64, -0.065, 0, 195, 0, 0, 0, 1, 0]), child: tile) : tile),
                      MarkerLayer(markers: [
                        Marker(point: center, width: 36, height: 36, child: Container(decoration: BoxDecoration(color: t.accentStrong, shape: BoxShape.circle, border: Border.all(color: t.raised)), child: RsIcon(Symbols.home, size: 16, color: t.onAccent))),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (final c in electric)
              card(
                avatar: person(true),
                title: c.name,
                badge: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: t.accent, borderRadius: Rad.b2), child: Row(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.bolt, size: 12, color: t.onAccent, filled: true), const SizedBox(width: 4), Text(l.courierElectric, style: AppType.sized(AppType.label, 10).copyWith(color: t.onAccent))])),
                meta: meta(c.km),
                stripe: RsStripe.accent,
                primary: true,
                note: l.courierZero,
              ),
            for (final c in standard) card(avatar: person(false), title: c.name, meta: meta(c.km), stripe: RsStripe.line, primary: false),
            card(
              avatar: Container(width: 48, height: 48, decoration: BoxDecoration(color: t.muted, borderRadius: Rad.b12, border: Border.all(color: t.line)), alignment: Alignment.center, child: RsIcon(Symbols.local_shipping, color: AppColors.sell)),
              title: l.courierCargo,
              badge: RsTag(l.courierHeavy),
              meta: '',
              stripe: RsStripe.sell,
              primary: false,
            ),
          ]),
        ),
      ),
    );
  }
}
