import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/notifications/presentation/viewmodel/notifications_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class NotificationPrefsNotifier extends AutoDisposeAsyncNotifier<Map<String, bool>> {
  @override
  Future<Map<String, bool>> build() async {
    final raw = await ref.watch(apiServiceProvider).getNotificationPreferences();
    return {for (final e in raw.entries) e.key: e.value != false};
  }

  Future<void> set(String key, bool value) async {
    final prev = state.valueOrNull ?? {};
    state = AsyncData({...prev, key: value});
    try {
      await ref.read(apiServiceProvider).updateNotificationPreferences({key: value});
      ref.invalidate(notificationsViewModelProvider);
    } catch (_) {
      state = AsyncData(prev);
    }
  }
}

final notificationPrefsProvider = AutoDisposeAsyncNotifierProvider<NotificationPrefsNotifier, Map<String, bool>>(NotificationPrefsNotifier.new);

class NotificationPrefsScreen extends ConsumerWidget {
  const NotificationPrefsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final async = ref.watch(notificationPrefsProvider);
    final prefs = async.valueOrNull ?? const <String, bool>{};
    final rows = [
      ('recycle', Symbols.recycling, l.prefRecycle, l.prefRecycleSub),
      ('marketplace', Symbols.sell, l.prefMarket, l.prefMarketSub),
      ('rewards', Symbols.redeem, l.prefRewards, l.prefRewardsSub),
      ('system', Symbols.notifications, l.prefSystem, l.prefSystemSub),
    ];
    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsBrandBar(title: l.setNotifs, backLeading: true, iconColor: t.accent),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: ListView(padding: const EdgeInsets.all(24), children: [
            Text(l.prefHint, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 24),
            if (async.hasError) Padding(padding: const EdgeInsets.only(bottom: 12), child: Text(l.commonError, style: AppType.caption.copyWith(color: t.danger))),
            if (async.isLoading) const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator())) else
              RsGroup(children: [
                for (final r in rows)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(children: [
                      RsIconBox(r.$2, size: 40, color: t.fg2),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(r.$3, style: AppType.bodyMd.copyWith(color: t.fg)),
                        Text(r.$4, style: AppType.caption.copyWith(color: t.fg2)),
                      ])),
                      Switch(value: prefs[r.$1] ?? true, onChanged: (v) => ref.read(notificationPrefsProvider.notifier).set(r.$1, v)),
                    ]),
                  ),
              ]),
          ]),
        ),
      ),
    );
  }
}
