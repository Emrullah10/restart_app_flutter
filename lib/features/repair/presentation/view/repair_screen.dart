import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/core/utils/format.dart';
import 'package:mobile_flutter/core/utils/geo.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RepairScreen extends ConsumerWidget {
  const RepairScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final here = ref.watch(userLocationProvider).valueOrNull;
    final services = ref.watch(servicesByTypeProvider('repair')).valueOrNull ?? const [];

    Widget tile(IconData icon, String title, String sub) => RsPressable(
          scale: 0.98,
          onTap: () => context.go('${Routes.map}?filter=repair'),
          child: RsCard(
            tone: RsTone.raised,
            stripe: RsStripe.repair,
            padding: const EdgeInsets.all(20),
            child: SizedBox(width: double.infinity, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: 48, height: 48, decoration: BoxDecoration(color: t.muted, borderRadius: Rad.b12), alignment: Alignment.center, child: RsIcon(icon, color: AppColors.repair, filled: true)),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: AppType.headingMd.copyWith(color: t.fg)),
              const SizedBox(height: 4),
              Text(sub, textAlign: TextAlign.center, style: AppType.caption.copyWith(color: t.fg2)),
            ])),
          ),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsBrandBar(menuFilled: true, iconColor: t.accent),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: ListView(padding: const EdgeInsets.fromLTRB(20, 24, 20, 24), children: [
            Text(l.repairTitle, style: AppType.displayLgMobile.copyWith(color: t.fg)),
            const SizedBox(height: 8),
            Text(l.repairSub, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 24),
            RsCard(
              tone: RsTone.accentSubtle,
              stripe: RsStripe.accentStrong,
              borderColor: t.accentContainerDim,
              padding: const EdgeInsets.all(20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(width: 4),
                Container(width: 40, height: 40, decoration: BoxDecoration(color: t.raised, borderRadius: Rad.b12, border: Border.all(color: t.line)), alignment: Alignment.center, child: RsIcon(Symbols.energy_savings_leaf, color: t.accentStrong, filled: true)),
                const SizedBox(width: 16),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(l.repairEcoTitle, style: AppType.headingMd.copyWith(color: t.onAccentSubtle)),
                  const SizedBox(height: 4),
                  Text(l.repairEcoBody, style: AppType.caption.copyWith(color: t.fg2)),
                ])),
              ]),
            ),
            const SizedBox(height: 24),
            RsSectionLabel(l.repairServices, color: t.fg3, letterSpacing: 1),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: tile(Symbols.smartphone, l.repairScreen, l.repairScreenSub)),
              const SizedBox(width: 16),
              Expanded(child: tile(Symbols.battery_charging_full, l.repairBattery, l.repairBatterySub)),
            ]),
            const SizedBox(height: 16),
            RsPressable(
              scale: 0.98,
              onTap: () => context.go('${Routes.map}?filter=repair'),
              child: RsCard(
                tone: RsTone.raised,
                stripe: RsStripe.repair,
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  const SizedBox(width: 8),
                  Container(width: 48, height: 48, decoration: BoxDecoration(color: t.muted, borderRadius: Rad.b12), alignment: Alignment.center, child: RsIcon(Symbols.memory, color: AppColors.repair, filled: true)),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(l.repairBoard, style: AppType.headingMd.copyWith(color: t.fg)),
                    const SizedBox(height: 4),
                    Text(l.repairBoardSub, style: AppType.caption.copyWith(color: t.fg2)),
                  ])),
                  RsIcon(Symbols.chevron_right, color: t.fg3),
                ]),
              ),
            ),
            const SizedBox(height: 32),
            RsSectionRow(l.repairNearby, action: l.commonAll, onAction: () => context.go('${Routes.map}?filter=repair')),
            const SizedBox(height: 16),
            for (final s in services)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RsCard(
                  tone: RsTone.raised,
                  stripe: RsStripe.line,
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    const SizedBox(width: 8),
                    RsIconBox(s.name.toLowerCase().contains('mobil') ? Symbols.build_circle : Symbols.store, tone: RsTone.strong),
                    const SizedBox(width: 16),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(s.name, style: AppType.headingMd.copyWith(color: t.fg), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Row(children: [
                        if (s.rating > 0) ...[RsIcon(Symbols.star, size: 14, color: AppColors.sell, filled: true), const SizedBox(width: 2), Text(fmt.number(s.rating, digits: 1), style: AppType.caption.copyWith(color: AppColors.sell, fontWeight: FontWeight.w500))],
                        () {
                          final km = distanceKm(here, s.latitude, s.longitude);
                          return km == null ? const SizedBox.shrink() : Text('${s.rating > 0 ? '  •  ' : ''}${fmt.number(km, digits: 1)}${l.commonUnitKm}', style: AppType.caption.copyWith(color: t.fg2));
                        }(),
                      ]),
                    ])),
                    Container(width: 32, height: 32, decoration: BoxDecoration(color: t.raised, borderRadius: Rad.b2, border: Border.all(color: t.line)), alignment: Alignment.center, child: RsIcon(Symbols.arrow_forward, size: 20, color: t.accentStrong)),
                  ]),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
