import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/core/utils/format.dart';
import 'package:mobile_flutter/core/utils/modules.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/activity_view_model.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final user = ref.watch(authViewModelProvider).valueOrNull;
    final profile = ref.watch(profileViewModelProvider).valueOrNull;
    final acts = ref.watch(activityViewModelProvider).valueOrNull ?? const [];
    final name = profile?.fullName ?? user?.fullName ?? '';
    int count(String type) => acts.where((a) => a.type == type).length;
    final total = (count('recycle') + count('sell') + count('repair')).clamp(1, 1 << 30);
    final bars = [('recycle', t.accent, l.homeRecycle), ('sell', AppColors.sell, l.homeSell), ('repair', AppColors.repair, l.homeRepair)];

    Widget stat(String label, String value, RsStripe stripe) => RsCard(
          tone: RsTone.raised,
          stripe: stripe,
          padding: const EdgeInsets.all(20),
          child: SizedBox(height: 84, width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerLeft, child: Text(label, maxLines: 1, style: AppType.label.copyWith(color: t.fg2, letterSpacing: 1))),
            Text(value, style: AppType.dataXl.copyWith(color: t.fg)),
          ])),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + 32, 24, 24), children: [
            Column(children: [
              RsAvatar(name: name, size: 96, accent: true, borderColor: t.canvas, fontSize: 40),
              const SizedBox(height: 16),
              Text(name, style: AppType.headingLg.copyWith(color: t.fg)),
              const SizedBox(height: 4),
              Text(user?.email ?? '', style: AppType.bodyMd.copyWith(color: t.fg2)),
              const SizedBox(height: 16),
              Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: t.muted, borderRadius: Rad.b12, border: Border.all(color: t.line)), child: Row(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.verified, size: 16, color: t.accent), const SizedBox(width: 8), Text(l.profVerified, style: AppType.label.copyWith(color: t.accent))])),
            ]),
            const SizedBox(height: 32),
            GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.45, children: [
              stat(l.profTotal, fmt.number(acts.length), RsStripe.accent),
              stat(l.profCo2, fmt.number(double.tryParse(profile?.co2Saved ?? '') ?? 0), RsStripe.brand),
              stat(l.profSold, fmt.number(count('sell')), RsStripe.sell),
              stat(l.profRepaired, fmt.number(profile?.repairedCount ?? 0), RsStripe.repair),
            ]),
            const SizedBox(height: 32),
            RsCard(
              tone: RsTone.raised,
              padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [RsIcon(Symbols.bar_chart, color: t.accent), const SizedBox(width: 12), Text(l.profImpact, style: AppType.headingMd.copyWith(color: t.fg))]),
                const SizedBox(height: 24),
                for (final b in bars) ...[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(b.$3, style: AppType.label.copyWith(color: t.fg2)), Text(l.profOps(count(b.$1).toString()), style: AppType.bodyMd.copyWith(color: t.fg, fontWeight: FontWeight.w600))]),
                  const SizedBox(height: 8),
                  RsProgressBar(value: count(b.$1) / total, fill: b.$2, track: t.muted, height: 8, radius: Rad.b12),
                  const SizedBox(height: 20),
                ],
              ]),
            ),
            const SizedBox(height: 32),
            RsCard(
              tone: RsTone.raised,
              padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l.profRecent, style: AppType.headingMd.copyWith(color: t.fg)), GestureDetector(onTap: () => context.go(Routes.notifications), child: Text(l.commonAll, style: AppType.label.copyWith(color: t.accent)))]),
                const SizedBox(height: 24),
                Container(decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))), child: Column(children: [
                  for (final a in acts.take(4))
                    Builder(builder: (context) {
                      final m = moduleOf(a.type);
                      final sell = a.type == 'sell', repair = a.type == 'repair';
                      final bg = sell ? t.sellTint : (repair ? t.repairTint : t.accentSubtle);
                      final right = a.pointsEarned > 0 ? (l.profPointsGain(fmt.number(a.pointsEarned)), t.accent) : (a.amountEarned > 0 ? (fmt.currency(a.amountEarned), t.fg) : ('', t.fg));
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
                        child: Row(children: [
                          RsIconBox(m.icon, size: 48, bg: bg, color: m.color(t)),
                          const SizedBox(width: 16),
                          Expanded(child: Text(a.title, style: AppType.bodyMd.copyWith(color: t.fg, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis)),
                          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            if (right.$1.isNotEmpty) Text(right.$1, style: AppType.label.copyWith(color: right.$2)),
                            const SizedBox(height: 4),
                            Text(fmt.relative(a.createdAt), style: AppType.caption.copyWith(color: t.fg2)),
                          ]),
                        ]),
                      );
                    }),
                ])),
              ]),
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    );
  }
}
