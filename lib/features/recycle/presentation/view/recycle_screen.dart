import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleScreen extends ConsumerStatefulWidget {
  const RecycleScreen({super.key});
  @override
  ConsumerState<RecycleScreen> createState() => _RecycleScreenState();
}

class _RecycleScreenState extends ConsumerState<RecycleScreen> {
  String? _device = 'phone';

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final items = [
      ('phone', Symbols.smartphone, l.recPhone, l.recPhoneSub),
      ('laptop', Symbols.laptop_mac, l.recLaptop, l.recLaptopSub),
      ('tablet', Symbols.tablet_mac, l.recTablet, l.recTabletSub),
      ('other', Symbols.devices_other, l.recOther, l.recOtherSub),
    ];
    return Scaffold(
      backgroundColor: t.canvas,
      body: SafeArea(
        bottom: false,
        child: ListView(padding: const EdgeInsets.all(24), children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(l.recStep('1'), style: AppType.label.copyWith(color: t.accent)),
            Text(l.recStepDevice, style: AppType.label.copyWith(color: t.fg2)),
          ]),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: RsProgressBarSegment(active: true)),
            const SizedBox(width: 4),
            Expanded(child: RsProgressBarSegment()),
            const SizedBox(width: 4),
            Expanded(child: RsProgressBarSegment()),
          ]),
          const SizedBox(height: 32),
          Text(l.recQuestion, style: AppType.headingLg.copyWith(color: t.fg)),
          const SizedBox(height: 8),
          Text(l.recQuestionSub, style: AppType.bodyMd.copyWith(color: t.fg2)),
          const SizedBox(height: 32),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, mainAxisExtent: 192),
            children: [
              for (final d in items)
                RsPressable(
                  scale: 0.98,
                  onTap: () => setState(() => _device = d.$1),
                  child: RsCard(
                    tone: RsTone.raised,
                    stripe: _device == d.$1 ? RsStripe.accent : RsStripe.none,
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(width: double.infinity, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RsIcon(d.$2, size: 36, color: _device == d.$1 ? t.accent : t.fg2),
                      const SizedBox(height: 16),
                      Text(d.$3, style: AppType.headingMd.copyWith(color: t.fg)),
                      const SizedBox(height: 4),
                      Text(d.$4, textAlign: TextAlign.center, style: AppType.caption.copyWith(color: t.fg2)),
                    ])),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: RsButton(l.recContinue, full: false, radius: Rad.b2, onPressed: _device == null ? null : () {
              ref.read(recycleViewModelProvider.notifier).setWasteType(_device!);
              context.go(Routes.recycleDetails);
            }),
          ),
        ]),
      ),
    );
  }
}
