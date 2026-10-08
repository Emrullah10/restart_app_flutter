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
import 'package:teknolup/core/utils/reward_visuals.dart';
import 'package:teknolup/features/profile/data/models/leaderboard.dart';
import 'package:teknolup/features/profile/presentation/viewmodel/gamification_view_model.dart';
import 'package:teknolup/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:teknolup/features/rewards/presentation/viewmodel/rewards_view_model.dart';
import 'package:teknolup/features/sell/presentation/viewmodel/marketplace_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final profile = ref.watch(profileViewModelProvider).valueOrNull;
    final board = ref.watch(leaderboardViewModelProvider).valueOrNull;
    final badges = ref.watch(badgesViewModelProvider).valueOrNull ?? const [];
    final rewards = ref.watch(rewardsViewModelProvider).valueOrNull ?? const [];
    final listings = ref.watch(listingsViewModelProvider).valueOrNull ?? const [];
    final points = profile?.totalPoints ?? 0;
    final lvl = computeLevel(points);
    final tier = switch (lvl.tier) { 'gold' => l.tierGold, 'silver' => l.tierSilver, _ => l.tierBronze };
    final sold = listings.where((e) => e.status == 'sold').length;

    String label(RewardLabel? r) => switch (r) { RewardLabel.digital => l.rewDigital, RewardLabel.transit => l.rewTransit, RewardLabel.service => l.rewService, RewardLabel.eco => l.rewEco, null => '' };

    Widget stat(String k, String v, {bool accent = false}) => Expanded(child: Padding(padding: const EdgeInsets.only(right: 8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(k, style: AppType.label.copyWith(color: t.fg3)),
          const SizedBox(height: 4),
          Text(v, style: AppType.headingMd.copyWith(color: accent ? t.accent : t.fg)),
        ])));

    Widget rankRow(LeaderboardEntry e, {bool me = false, bool first = false}) {
      final rankColor = me ? t.accent : (e.rank == 1 ? AppColors.sell : (e.rank == 3 ? AppColors.copper500 : t.fg3));
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: me ? t.accentSubtle : (first ? t.field : null), borderRadius: Rad.b2, border: me ? Border.all(color: t.accentContainer) : null),
        child: Row(children: [
          SizedBox(width: 16, child: Text('${e.rank}', textAlign: TextAlign.center, style: AppType.label.copyWith(color: rankColor))),
          const SizedBox(width: 12),
          RsAvatar(name: e.fullName, size: 24, borderColor: me ? t.accent : null),
          const SizedBox(width: 12),
          Expanded(child: Text(me ? l.rewYou : e.fullName, style: AppType.sized(AppType.bodyMd, 14).copyWith(color: me ? t.onAccentSubtle : t.fg, fontWeight: me ? FontWeight.w600 : FontWeight.w400))),
          Text(fmt.compact(e.totalPoints), style: AppType.label.copyWith(color: me ? t.accent : t.fg2)),
        ]),
      );
    }

    final top = board?.topUsers ?? const <LeaderboardEntry>[];
    final me = board?.currentUser;

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(startTitle: l.brandName, titleStyle: AppType.headingLg.copyWith(color: t.accent), trailing: rsBell(context, color: t.fg3)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(padding: const EdgeInsets.all(24), children: [
            Text(l.rewTitle, style: AppType.headingLg.copyWith(color: t.fg)),
            const SizedBox(height: 8),
            Text(l.rewSub, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 16),
            Align(alignment: Alignment.centerLeft, child: RsButton(l.rewHistory, full: false, radius: Rad.b4, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), onPressed: () => context.go(Routes.profile))),
            const SizedBox(height: 32),
            RsCard(
              tone: RsTone.raised,
              radius: Rad.b8,
              stripe: RsStripe.accent,
              padding: const EdgeInsets.all(24),
              child: SizedBox(width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.rewBalance, style: AppType.label.copyWith(color: t.fg3, letterSpacing: 1.2)),
                const SizedBox(height: 8),
                Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
                  Text(fmt.number(points), style: AppType.dataXl.copyWith(color: t.fg, letterSpacing: -1)),
                  const SizedBox(width: 12),
                  Text(l.commonPointsLower, style: AppType.label.copyWith(color: t.accent)),
                ]),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))),
                  child: Column(children: [
                    Row(children: [stat(l.rewRecycled, '${fmt.number(profile?.preventedWasteKg ?? 0)}${l.commonUnitKg}'), stat(l.rewRepaired, fmt.number(profile?.repairedCount ?? 0))]),
                    const SizedBox(height: 16),
                    Row(children: [stat(l.rewSold, fmt.number(sold)), stat(l.rewTier, tier, accent: true)]),
                  ]),
                ),
              ])),
            ),
            const SizedBox(height: 24),
            RsCard(
              tone: RsTone.raised,
              radius: Rad.b8,
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(padding: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l.rewTop, style: AppType.label.copyWith(color: t.fg, letterSpacing: 1.2)), RsIcon(Symbols.leaderboard, size: 18, color: t.fg3)])),
                const SizedBox(height: 16),
                for (var i = 0; i < top.length; i++) ...[if (i > 0) const SizedBox(height: 12), rankRow(top[i], first: i == 0)],
                if (me != null) ...[const SizedBox(height: 8), Divider(color: t.line), const SizedBox(height: 8), rankRow(me, me: true)],
              ]),
            ),
            const SizedBox(height: 24),
            RsCard(
              tone: RsTone.raised,
              radius: Rad.b8,
              padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l.rewAchievements, style: AppType.headingMd.copyWith(color: t.fg)), Text(l.commonAll, style: AppType.label.copyWith(color: t.accent))]),
                const SizedBox(height: 20),
                GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.05, children: [
                  for (var i = 0; i < badges.length; i++)
                    badges[i].isUnlocked
                        ? RsCard(tone: RsTone.field, padding: const EdgeInsets.all(12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [RsIcon(badgeIcon(badges[i].icon), size: 30, color: [t.accent, AppColors.sell, AppColors.repair][i % 3], filled: true), const SizedBox(height: 8), Text(badges[i].name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppType.sized(AppType.label, 10).copyWith(color: t.fg))]))
                        : Opacity(opacity: 0.5, child: RsCard(tone: RsTone.surface, dashed: true, padding: const EdgeInsets.all(12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [RsIcon(badgeIcon(badges[i].icon), size: 30, color: t.fg3), const SizedBox(height: 8), Text(badges[i].name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppType.sized(AppType.label, 10).copyWith(color: t.fg2))]))),
                ]),
              ]),
            ),
            const SizedBox(height: 24),
            Text(l.rewCatalog, style: AppType.headingMd.copyWith(color: t.fg)),
            const SizedBox(height: 16),
            if (rewards.isEmpty) Text(l.rewNone, style: AppType.caption.copyWith(color: t.fg2)),
            for (final r in rewards)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Builder(builder: (context) {
                  final v = rewardVisual(r.title, r.subtitle);
                  final can = points >= r.pointsCost;
                  return RsCard(
                    tone: RsTone.raised,
                    radius: Rad.b8,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                        height: 128,
                        width: double.infinity,
                        color: t.muted,
                        child: Stack(children: [
                          Center(child: RsIcon(v.icon, size: 40, color: t.fg3)),
                          if (v.label != null) Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: t.raised, borderRadius: Rad.b2, boxShadow: Shadows.sm), child: Text(label(v.label), style: AppType.sized(AppType.label, 10).copyWith(color: v.label == RewardLabel.transit ? AppColors.repair : t.accent)))),
                        ]),
                      ),
                      Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(r.title, style: AppType.sized(AppType.headingMd, 16).copyWith(color: t.fg)),
                        const SizedBox(height: 4),
                        Text(r.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppType.caption.copyWith(color: t.fg3)),
                        const SizedBox(height: 16),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('${fmt.number(r.pointsCost)} ${l.commonPointsLower}', style: AppType.label.copyWith(color: can ? t.accent : t.danger, fontWeight: FontWeight.w700)),
                          RsPressable(
                            onTap: can ? () async {
                              final ok = await ref.read(rewardsViewModelProvider.notifier).redeem(r.id);
                              if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? l.rewRedeemed : l.rewFailed)));
                            } : null,
                            child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(borderRadius: Rad.b2, border: Border.all(color: t.line)), child: Text(l.rewUse, style: AppType.sized(AppType.label, 11).copyWith(color: can ? t.fg : t.fg3))),
                          ),
                        ]),
                      ])),
                    ]),
                  );
                }),
              ),
          ]),
        ),
      ),
    );
  }
}
