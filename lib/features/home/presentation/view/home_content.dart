import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/app/router/app_routes.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/utils/format.dart';
import 'package:teknolup/core/utils/level.dart';
import 'package:teknolup/core/utils/modules.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/features/home/data/models/activity.dart';
import 'package:teknolup/features/home/presentation/viewmodel/activity_view_model.dart';
import 'package:teknolup/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:teknolup/features/sell/presentation/viewmodel/marketplace_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/design_system/rs_parts.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final user = ref.watch(authViewModelProvider).valueOrNull;
    final profile = ref.watch(profileViewModelProvider).valueOrNull;
    final listings = ref.watch(listingsViewModelProvider).valueOrNull ?? const [];
    final acts = (ref.watch(activityViewModelProvider).valueOrNull ?? const <Activity>[]).take(2).toList();
    final name = (profile?.fullName ?? user?.fullName ?? '').trim().split(' ').first;
    final co2 = double.tryParse(profile?.co2Saved ?? '') ?? 0;
    final lvl = computeLevel(profile?.totalPoints ?? 0);
    final activeListings = listings.where((e) => e.status == 'active').length;

    Widget action(IconData icon, Color color, String label, RsStripe stripe, VoidCallback onTap) => Expanded(
          child: RsPressable(
            onTap: onTap,
            child: RsCard(
              stripe: stripe,
              radius: Rad.b8,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RsIcon(icon, size: 28, color: color),
                  const SizedBox(height: 12),
                  Text(label, textAlign: TextAlign.center, style: AppType.label.copyWith(color: t.fg)),
                ]),
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: const RsBrandBar(large: false),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.homeGreeting(name.isEmpty ? '' : name), style: AppType.headingLg.copyWith(color: t.fg)),
          const SizedBox(height: 4),
          Text(l.homeSub, style: AppType.bodyMd.copyWith(color: t.fg3)),
          const SizedBox(height: 24),
          RsCard(
            tone: RsTone.subtle,
            radius: Rad.b8,
            padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(l.homeImpact, style: AppType.label.copyWith(color: t.fg2, letterSpacing: 1.2)),
                RsIcon(Symbols.eco, color: t.accent),
              ]),
              const SizedBox(height: 16),
              Text('${fmt.number(co2, digits: co2 == co2.roundToDouble() ? 0 : 1)} ${l.commonUnitKg}', style: AppType.displayLgMobile.copyWith(color: t.accent)),
              const SizedBox(height: 4),
              Text(l.homeCo2, style: AppType.bodyMd.copyWith(color: t.fg2)),
              const SizedBox(height: 16),
              RsProgressBar(value: lvl.progress, fill: t.accent, track: t.line),
            ]),
          ),
          const SizedBox(height: 24),
          IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            action(Symbols.build, AppColors.repair, l.homeRepair, RsStripe.repair, () => context.go(Routes.repair)),
            const SizedBox(width: 12),
            action(Symbols.sell, AppColors.sell, l.homeSell, RsStripe.sell, () => context.go(Routes.sell)),
            const SizedBox(width: 12),
            action(Symbols.recycling, t.accent, l.homeRecycle, RsStripe.accent, () => context.go(Routes.recycle)),
          ])),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(child: _Bento(label: l.homePoints, value: fmt.number(profile?.totalPoints ?? 0))),
            const SizedBox(width: 12),
            Expanded(child: _Bento(label: l.homeListings, value: fmt.number(activeListings))),
          ]),
          const SizedBox(height: 24),
          Text(l.homeRecent, style: AppType.headingMd.copyWith(color: t.fg)),
          const SizedBox(height: 16),
          RsCard(
            radius: Rad.b8,
            child: acts.isEmpty
                ? Padding(padding: const EdgeInsets.all(16), child: Text(l.homeNoActivity, style: AppType.caption.copyWith(color: t.fg2)))
                : Column(children: [
                    for (var i = 0; i < acts.length; i++) ...[
                      if (i > 0) Divider(height: 1, color: t.line),
                      _ActivityRow(acts[i], fmt),
                    ],
                  ]),
          ),
        ],
      ),
    );
  }
}

class _Bento extends StatelessWidget {
  final String label, value;
  const _Bento({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsCard(
      tone: RsTone.field,
      radius: Rad.b8,
      padding: const EdgeInsets.all(20),
      child: SizedBox(width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: AppType.label.copyWith(color: t.fg3)),
        const SizedBox(height: 4),
        Text(value, style: AppType.dataLg.copyWith(color: t.fg)),
      ])),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final Activity a;
  final Fmt fmt;
  const _ActivityRow(this.a, this.fmt);
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final m = moduleOf(a.type);
    final sub = a.pointsEarned > 0 ? context.l10n.profPointsGain(fmt.number(a.pointsEarned)) : (a.amountEarned > 0 ? '+${fmt.currency(a.amountEarned)}' : '');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        RsIconBox(m.icon, size: 40, iconSize: 20, tone: RsTone.field, color: m.color(t), radius: Rad.b12, border: true),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(a.title, style: AppType.label.copyWith(color: t.fg), maxLines: 1, overflow: TextOverflow.ellipsis),
          if (sub.isNotEmpty) Text(sub, style: AppType.caption.copyWith(color: t.fg3)),
        ])),
        Text(fmt.relative(a.createdAt), style: AppType.label.copyWith(color: t.fg3)),
      ]),
    );
  }
}
