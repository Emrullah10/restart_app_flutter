import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/core/utils/format.dart';
import 'package:mobile_flutter/core/utils/recycle_points.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_state.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleSuccessScreen extends ConsumerWidget {
  const RecycleSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final s = ref.watch(recycleViewModelProvider);
    final points = s.resultTotalPoints ?? estimateRecyclePoints(weightKg: s.weightKg, isElectric: s.selectedMode == TransportMode.electric).total;
    final co2 = co2ForWeight(s.weightKg);

    return Scaffold(
      backgroundColor: t.canvas,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 512),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(width: 96, height: 96, decoration: BoxDecoration(color: t.accentContainer, borderRadius: Rad.b12, border: Border.all(color: t.accent)), alignment: Alignment.center, child: RsIcon(Symbols.check_circle, size: 48, color: t.accent, filled: true)),
                const SizedBox(height: 32),
                Text(l.doneTitle, textAlign: TextAlign.center, style: AppType.displayLgMobile.copyWith(color: t.fg)),
                const SizedBox(height: 32),
                RsCard(
                  tone: RsTone.raised,
                  stripe: RsStripe.accent,
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(width: double.infinity, child: Column(children: [
                    Text(l.doneEarned, style: AppType.label.copyWith(color: t.fg2, letterSpacing: 1.2)),
                    const SizedBox(height: 12),
                    Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
                      Text('+${fmt.number(points)}', style: AppType.dataXl.copyWith(color: t.accent)),
                      const SizedBox(width: 8),
                      Text(l.commonPoints.toUpperCase(), style: AppType.label.copyWith(color: t.accent)),
                    ]),
                    const SizedBox(height: 12),
                    Divider(height: 24, color: t.line),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [RsIcon(Symbols.co2, size: 20, color: t.fg2), const SizedBox(width: 8), Flexible(child: Text(l.doneCo2(fmt.number(co2, digits: 2)), style: AppType.bodyMd.copyWith(color: t.fg2)))]),
                  ])),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: t.strong, borderRadius: Rad.b12, border: Border.all(color: t.lineStrong)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.workspace_premium, size: 16, color: t.accentStrong), const SizedBox(width: 8), Text(l.doneCert, style: AppType.label.copyWith(color: t.fg))]),
                ),
                const Spacer(),
                RsButton(l.doneHome, height: 48, padding: EdgeInsets.zero, textStyle: AppType.label.copyWith(letterSpacing: 2), onPressed: () {
                  ref.read(recycleViewModelProvider.notifier).reset();
                  context.go(Routes.home);
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
