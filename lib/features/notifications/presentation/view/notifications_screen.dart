import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/utils/format.dart';
import 'package:teknolup/features/notifications/data/models/app_notification.dart';
import 'package:teknolup/features/notifications/presentation/viewmodel/notifications_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final async = ref.watch(notificationsViewModelProvider);
    final all = async.valueOrNull ?? const <AppNotification>[];
    final now = DateTime.now();
    int dayDiff(DateTime d) => DateTime(now.year, now.month, now.day).difference(DateTime(d.year, d.month, d.day)).inDays;
    final groups = [
      (l.notifToday, all.where((n) => dayDiff(n.createdAt) <= 0).toList()),
      (l.notifYesterday, all.where((n) => dayDiff(n.createdAt) == 1).toList()),
      (l.notifOlder, all.where((n) => dayDiff(n.createdAt) > 1).toList()),
    ].where((g) => g.$2.isNotEmpty).toList();

    (IconData, Color, Color) style(AppNotification n) => switch (n.type) {
          'recycle' => (Symbols.recycling, t.accentSubtle, t.accent),
          'sell' => (Symbols.sell, t.sellTint, AppColors.sell),
          'repair' => (Symbols.build, t.repairTint, AppColors.repair),
          'reward' => (Symbols.redeem, t.strong, t.fg2),
          _ => (Symbols.notifications, t.strong, t.fg2),
        };

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(
        bg: t.canvas.withValues(alpha: 0.9),
        bordered: false,
        leading: Padding(padding: const EdgeInsets.only(right: 8), child: rsBack(context, color: t.fg2)),
        startTitle: l.notifTitle,
        titleStyle: AppType.headingLg.copyWith(color: t.fg, letterSpacing: -0.3),
        trailing: GestureDetector(onTap: () => ref.read(notificationsViewModelProvider.notifier).markAllAsRead(), child: Text(l.notifMarkAll, style: AppType.sized(AppType.label, 10).copyWith(color: t.accent, letterSpacing: 1.2))),
      ),
      body: all.isEmpty && !async.isLoading
          ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.notifications, size: 40, color: t.fg3), const SizedBox(height: 12), Text(l.notifEmpty, style: AppType.headingMd.copyWith(color: t.fg)), const SizedBox(height: 4), Text(l.notifEmptySub, style: AppType.caption.copyWith(color: t.fg2))]))
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: ListView(padding: const EdgeInsets.fromLTRB(16, 24, 16, 24), children: [
                  for (final g in groups) ...[
                    Padding(padding: const EdgeInsets.only(left: 4, bottom: 16), child: Text(g.$1, style: AppType.label.copyWith(color: t.fgOutline, letterSpacing: 1.2))),
                    for (final n in g.$2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: RsCard(
                          tone: n.isRead ? RsTone.surface : RsTone.muted,
                          stripe: n.isRead ? RsStripe.none : RsStripe.accent,
                          padding: const EdgeInsets.all(16),
                          child: Stack(children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              RsIconBox(style(n).$1, size: 40, bg: n.isRead ? t.strong : style(n).$2, color: n.isRead ? t.fg2 : style(n).$3, radius: Rad.b12),
                              const SizedBox(width: 16),
                              Expanded(child: Padding(padding: const EdgeInsets.only(right: 24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(n.title, style: AppType.bodyMd.copyWith(color: t.fg, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 4),
                                Text(n.body, style: AppType.caption.copyWith(color: t.fg2)),
                                const SizedBox(height: 4),
                                Text(fmt.time(n.createdAt), style: AppType.label.copyWith(color: t.fgOutline)),
                              ]))),
                            ]),
                            if (!n.isRead) Positioned(right: 0, top: 0, child: Container(width: 8, height: 8, decoration: BoxDecoration(color: t.accent, shape: BoxShape.circle))),
                          ]),
                        ),
                      ),
                    const SizedBox(height: 16),
                  ],
                ]),
              ),
            ),
    );
  }
}
