import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/app/router/app_routes.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/utils/format.dart';
import 'package:teknolup/core/utils/geo.dart';
import 'package:teknolup/core/utils/modules.dart';
import 'package:teknolup/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/design_system/rs_parts.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final here = ref.watch(userLocationProvider).valueOrNull;
    final services = (ref.watch(servicesViewModelProvider).valueOrNull ?? const []).take(3).toList();
    final cats = [
      (Symbols.smartphone, l.discoverPhone, 'phone'),
      (Symbols.laptop_mac, l.discoverLaptop, 'laptop'),
      (Symbols.tablet_mac, l.discoverTablet, 'tablet'),
      (Symbols.devices_other, l.discoverOther, 'accessory'),
    ];

    Widget promo(String? tag, Color tagColor, String title, String sub, {IconData? icon, RsStripe stripe = RsStripe.none, VoidCallback? onTap}) => RsPressable(
          scale: 0.98,
          onTap: onTap,
          child: SizedBox(
            width: 256,
            child: RsCard(
              tone: RsTone.raised,
              radius: Rad.b8,
              stripe: stripe,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 128,
                  width: double.infinity,
                  color: t.strong,
                  alignment: tag == null ? Alignment.center : Alignment.topLeft,
                  padding: tag == null ? null : const EdgeInsets.all(8),
                  child: tag == null
                      ? RsIcon(icon ?? Symbols.eco, size: 36, color: t.fgFaint)
                      : Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: t.raised.withValues(alpha: 0.9), borderRadius: Rad.b2, border: Border.all(color: tagColor.withValues(alpha: 0.2))), child: Text(tag, style: AppType.label.copyWith(color: tagColor))),
                ),
                Divider(height: 1, color: t.line),
                Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: AppType.headingMd.copyWith(color: t.fg), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(sub, style: AppType.caption.copyWith(color: t.fg2), maxLines: 1, overflow: TextOverflow.ellipsis),
                ])),
              ]),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(startTitle: l.discoverTitle, trailing: rsBell(context)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(padding: const EdgeInsets.only(bottom: 24), children: [
            Padding(padding: const EdgeInsets.fromLTRB(24, 24, 24, 16), child: RsTextField(hint: l.discoverSearch, icon: Symbols.search, radius: Rad.b4, fill: t.fieldCanvas, contentPadding: const EdgeInsets.fromLTRB(40, 12, 16, 12))),
            Padding(padding: const EdgeInsets.fromLTRB(24, 16, 24, 0), child: RsSectionLabel(l.discoverCategories, color: t.fg2, letterSpacing: 1)),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.45, children: [
                for (var i = 0; i < cats.length; i++)
                  RsPressable(
                    onTap: () => context.go(Routes.sell),
                    child: RsCard(
                      tone: RsTone.raised,
                      radius: Rad.b8,
                      padding: const EdgeInsets.all(20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Container(width: 40, height: 40, decoration: BoxDecoration(color: i == 0 ? t.accentSubtle : t.muted, borderRadius: Rad.b4, border: Border.all(color: i == 0 ? t.accent.withValues(alpha: 0.2) : t.lineStrong.withValues(alpha: 0.3))), alignment: Alignment.center, child: RsIcon(cats[i].$1, color: i == 0 ? t.accent : t.fg2)),
                        Text(cats[i].$2, style: AppType.headingMd.copyWith(color: t.fg)),
                      ]),
                    ),
                  ),
              ]),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(24, 16, 24, 16), child: RsSectionLabel(l.discoverFeatured, color: t.fg2, letterSpacing: 1)),
            SizedBox(
              height: 232,
              child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 24), children: [
                promo(l.discoverPromo1Tag, AppColors.repair, l.discoverPromo1Title, l.discoverPromo1Sub, onTap: () => context.go(Routes.repair)),
                const SizedBox(width: 16),
                promo(l.discoverPromo2Tag, AppColors.sell, l.discoverPromo2Title, l.discoverPromo2Sub, stripe: RsStripe.sell, onTap: () => context.go(Routes.createListing)),
                const SizedBox(width: 16),
                promo(null, t.fg3, l.discoverPromo3Title, l.discoverPromo3Sub, onTap: () => context.go(Routes.profile)),
              ]),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(24, 16, 24, 16), child: RsSectionRow(l.discoverNearby, action: l.commonAll, onAction: () => context.go(Routes.map))),
            for (final s in services)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                child: RsCard(
                  tone: RsTone.raised,
                  radius: Rad.b8,
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    RsIconBox(moduleOf(s.type).icon, size: 48, tone: RsTone.strong, border: true),
                    const SizedBox(width: 16),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(s.name, style: AppType.headingMd.copyWith(color: t.fg), maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(
                        [
                          () { final km = distanceKm(here, s.latitude, s.longitude); return km == null ? null : '${fmt.number(km, digits: 1)} ${l.commonUnitKm}'; }(),
                          s.address,
                        ].whereType<String>().where((e) => e.isNotEmpty).join(' • '),
                        style: AppType.caption.copyWith(color: t.fg2), maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                    ])),
                    RsIcon(Symbols.chevron_right, color: t.fgFaint),
                  ]),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
