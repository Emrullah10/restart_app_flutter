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
import 'package:teknolup/core/utils/recycle_points.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:teknolup/features/recycle/presentation/viewmodel/recycle_state.dart';
import 'package:teknolup/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

class RecycleActionScreen extends ConsumerStatefulWidget {
  const RecycleActionScreen({super.key});
  @override
  ConsumerState<RecycleActionScreen> createState() => _RecycleActionScreenState();
}

class _RecycleActionScreenState extends ConsumerState<RecycleActionScreen> {
  final _brand = TextEditingController(), _model = TextEditingController(), _weight = TextEditingController(text: '0.5');
  String _condition = 'working';
  bool _courier = false;
  String? _centerId;

  @override
  void dispose() {
    for (final c in [_brand, _model, _weight]) { c.dispose(); }
    super.dispose();
  }

  double get _kg => double.tryParse(_weight.text.replaceAll(',', '.')) ?? 0;

  Future<void> _submit() async {
    final l = context.l10n;
    final vm = ref.read(recycleViewModelProvider.notifier);
    vm.setWeight(_kg);
    if (_courier) {
      context.go(Routes.recycleCourier);
      return;
    }
    if (_centerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.recPickCenter)));
      return;
    }
    vm.setTransportMode(TransportMode.standard);
    final userId = ref.read(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return;
    final ok = await vm.submitRecycle(userId, _centerId, ref.read(recycleViewModelProvider).wasteType, _kg == 0 ? 1 : _kg);
    if (!mounted) return;
    if (ok) {
      context.go(Routes.recycleSuccess);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.recFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final here = ref.watch(userLocationProvider).valueOrNull;
    final centers = ref.watch(servicesByTypeProvider('recycle')).valueOrNull ?? const [];
    final loading = ref.watch(recycleViewModelProvider).isLoading;
    final est = estimateRecyclePoints(weightKg: _kg, isElectric: _courier);

    Widget input(String label, String ph, TextEditingController c, {TextInputType? type, Widget? suffix, ValueChanged<String>? onChanged}) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: AppType.label.copyWith(color: t.fg2)),
          const SizedBox(height: 6),
          Stack(alignment: Alignment.centerRight, children: [
            RsTextField(hint: ph, controller: c, keyboardType: type, radius: Rad.b2, fill: t.field, borderColor: t.lineStrong, onChanged: onChanged, contentPadding: EdgeInsets.fromLTRB(16, 12, suffix == null ? 16 : 48, 12)),
            if (suffix != null) Padding(padding: const EdgeInsets.only(right: 16), child: suffix),
          ]),
        ]);

    Widget conditionCard(String id, IconData icon, Color color, String title, String sub) {
      final sel = _condition == id;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: RsPressable(
          scale: 0.99,
          onTap: () => setState(() => _condition = id),
          child: RsCard(
            tone: sel ? RsTone.accentSubtle : RsTone.raised,
            stripe: sel ? RsStripe.accent : RsStripe.none,
            borderColor: sel ? t.accent : t.line,
            shadow: sel ? Shadows.sm : null,
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              const SizedBox(width: 8),
              RsIcon(icon, color: color),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: AppType.headingMd.copyWith(color: t.fg)),
                Text(sub, style: AppType.caption.copyWith(color: t.fg2)),
              ])),
              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sel ? t.accent : t.lineStrong, width: 2)), alignment: Alignment.center, child: sel ? Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: t.accent)) : null),
            ]),
          ),
        ),
      );
    }

    Widget delivery(bool courier, IconData icon, String label) {
      final sel = _courier == courier;
      return Expanded(
        child: RsPressable(
          scale: 0.98,
          onTap: () => setState(() => _courier = courier),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: sel ? t.accentSubtle : t.raised, borderRadius: Rad.b2, border: Border.all(color: sel ? t.accent : t.line)),
            child: Column(children: [
              RsIcon(icon, color: sel ? t.accent : t.fg2),
              const SizedBox(height: 8),
              Text(label, style: AppType.bodyMd.copyWith(color: sel ? t.onAccentSubtle : t.fg2, fontWeight: sel ? FontWeight.w600 : FontWeight.w400)),
            ]),
          ),
        ),
      );
    }

    Widget stepDot(Widget inner, bool filled, {bool current = false}) => Container(width: 24, height: 24, decoration: BoxDecoration(shape: BoxShape.circle, color: filled ? t.accent : t.strong, border: Border.all(color: t.canvas, width: 2)), alignment: Alignment.center, child: inner);

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsBrandBar(backLeading: true, iconColor: t.accent),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: ListView(padding: const EdgeInsets.all(24), children: [
            SizedBox(
              height: 56,
              child: Stack(alignment: Alignment.topCenter, children: [
                Positioned(left: 12, right: 12, top: 12, child: Container(height: 1, color: t.line)),
                Positioned(left: 12, top: 11, width: (MediaQuery.of(context).size.width - 48 - 24) / 2, child: Container(height: 2, color: t.accent)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(children: [stepDot(RsIcon(Symbols.check, size: 14, color: t.onAccent), true), const SizedBox(height: 8), Text(l.recStepCategory, style: AppType.caption.copyWith(color: t.fg2))]),
                  Column(children: [stepDot(Text('2', style: AppType.label.copyWith(color: t.onAccent)), true), const SizedBox(height: 8), Text(l.recStepDetails, style: AppType.caption.copyWith(color: t.fg, fontWeight: FontWeight.w600))]),
                  Column(children: [stepDot(Text('3', style: AppType.label.copyWith(color: t.fg2)), false), const SizedBox(height: 8), Text(l.recStepConfirm, style: AppType.caption.copyWith(color: t.fg2))]),
                ]),
              ]),
            ),
            const SizedBox(height: 32),
            Text(l.recDetailsTitle, style: AppType.headingLg.copyWith(color: t.fg)),
            const SizedBox(height: 8),
            Text(l.recDetailsSub, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 24),
            input(l.recBrand, l.recBrandPh, _brand),
            const SizedBox(height: 16),
            input(l.recModel, l.recModelPh, _model),
            const SizedBox(height: 24),
            Text(l.recCondition, style: AppType.label.copyWith(color: t.fg2)),
            const SizedBox(height: 12),
            conditionCard('working', Symbols.check_circle, t.accent, l.recWorking, l.recWorkingSub),
            conditionCard('damaged', Symbols.build, AppColors.sell, l.recDamaged, l.recDamagedSub),
            conditionCard('broken', Symbols.power_off, t.danger, l.recBroken, l.recBrokenSub),
            const SizedBox(height: 12),
            input(l.recWeight, '0.5', _weight, type: const TextInputType.numberWithOptions(decimal: true), suffix: Text(l.commonUnitKg, style: AppType.caption.copyWith(color: t.fg3)), onChanged: (_) => setState(() {})),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.recDelivery, style: AppType.headingMd.copyWith(color: t.fg)),
                const SizedBox(height: 16),
                Row(children: [delivery(false, Symbols.storefront, l.recDropoff), const SizedBox(width: 12), delivery(true, Symbols.local_shipping, l.recCourier)]),
                if (!_courier) ...[
                  const SizedBox(height: 16),
                  Text(l.recCenter, style: AppType.label.copyWith(color: t.fg2)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    initialValue: _centerId,
                    isExpanded: true,
                    icon: RsIcon(Symbols.expand_more, color: t.fg2),
                    dropdownColor: t.raised,
                    style: AppType.bodyMd.copyWith(color: t.fg),
                    hint: Text(l.recCenterPh, style: AppType.bodyMd.copyWith(color: t.fg3)),
                    decoration: InputDecoration(isDense: true, filled: true, fillColor: t.field, contentPadding: const EdgeInsets.fromLTRB(16, 12, 8, 12), enabledBorder: OutlineInputBorder(borderRadius: Rad.b2, borderSide: BorderSide(color: t.lineStrong)), focusedBorder: OutlineInputBorder(borderRadius: Rad.b2, borderSide: BorderSide(color: t.accent, width: 2))),
                    items: [
                      for (final c in centers)
                        DropdownMenuItem(value: c.id, child: Text(() {
                          final km = distanceKm(here, c.latitude, c.longitude);
                          return km == null ? c.name : '${c.name} (${fmt.number(km, digits: 1)} ${l.commonUnitKm})';
                        }(), overflow: TextOverflow.ellipsis)),
                    ],
                    onChanged: (v) {
                      setState(() => _centerId = v);
                      final c = centers.where((e) => e.id == v).firstOrNull;
                      ref.read(recycleViewModelProvider.notifier).setCenter(v, c?.name);
                    },
                  ),
                ],
              ]),
            ),
            const SizedBox(height: 16),
            RsCard(
              tone: RsTone.raised,
              stripe: RsStripe.accentStrong,
              shadow: Shadows.sm,
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                const SizedBox(width: 8),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(l.recEstimate, style: AppType.label.copyWith(color: t.fg2)),
                  Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
                    Text(fmt.number(est.total), style: AppType.dataXl.copyWith(color: t.accentStrong, letterSpacing: -2)),
                    const SizedBox(width: 4),
                    Text(l.commonPointsLower, style: AppType.caption.copyWith(color: t.fg2, fontWeight: FontWeight.w500)),
                  ]),
                  if (_courier) Text(l.recCourierBonus(fmt.number(est.bonus)), style: AppType.caption.copyWith(color: t.fg2)),
                ])),
                Container(width: 48, height: 48, decoration: BoxDecoration(color: t.accentStrong.withValues(alpha: 0.2), borderRadius: Rad.b12), alignment: Alignment.center, child: RsIcon(Symbols.workspace_premium, color: t.accentStrong, filled: true)),
              ]),
            ),
            const SizedBox(height: 16),
            RsButton(l.recSubmit, iconRight: Symbols.arrow_forward, loading: loading, onPressed: _submit, textStyle: AppType.headingMd, padding: const EdgeInsets.symmetric(vertical: 16)),
          ]),
        ),
      ),
    );
  }
}
